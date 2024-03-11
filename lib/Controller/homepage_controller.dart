import 'package:get/get.dart';
import 'package:harsh_task/Domain/Apis/Api_Client.dart';
import 'package:harsh_task/Domain/Model/home_model.dart';
import 'package:harsh_task/Helpers/api_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HomeController extends GetxController {
  final model = HomeModel().obs;
  RxBool callapi = false.obs;
  RxBool islod = true.obs;

  Future<void> CheckUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? check = prefs.getBool("first");
    if (check == null) {
      prefs.setInt("Page", 0);

      Sqldata();
    } else {
      islod.value = false;
      print("Secound time");
      selectData();
    }
  }

  Future<void> Sqldata() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE home(id INTEGER , avatarUrl TEXT,subscriptionsUrl TEXT,type TEXT)');
    });

    GetData();
  }

  Future<void> GetData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var page = await prefs.getInt("Page");
    print(homeapiUrl + page.toString());
    ApiClient().fetchGet(homeapiUrl + page.toString()).then((value) {
      model.value = HomeModel.fromJson(value);
      print(model.value.data!.length.toString());
      insertBulkData();
    });
  }

  Future<void> insertBulkData() async {
    final Database db = await openDatabase('demo.db');
    final Batch batch = db.batch();

    for (var data in model.value.data!) {
      batch.insert('home', {
        'id': data.id,
        'avatarUrl': data.avatarUrl,
        'subscriptionsUrl': data.subscriptionsUrl,
        'type': data.type,
      });
    }
    await batch.commit();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("first", true);
    int? a = await prefs.getInt("Page");
    print("Last Page" + a.toString());
    a = a! + 1;
    prefs.setInt("Page", a!);
    print("New Page" + await prefs.getInt("Page").toString());

    islod.value = false;
  }

  Future<List<Map<String, dynamic>>> selectData() async {
    final Database db = await openDatabase('demo.db');
    List<Map<String, dynamic>> result = await db.query('home');
    callapi.value = false;
    return result;
  }

  bool AddData() {
    if (callapi.value == false) {
      print("object1");
      GetData();
      callapi.value = true;
      return true;
    }
    return false;
  }
}
