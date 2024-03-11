import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/contectivity_controller.dart';
import 'Helpers/bindings/app_binding.dart';
import 'Screen/home_page.dart';

Future<void> main() async {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Harsh Task',
      debugShowCheckedModeBanner: false,
      home: CheckPage(),

      initialBinding:AppBinding(),
    );
  }
}

class CheckPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final connectivityService = Get.find<ConnectivityService>();

    return Scaffold(

      body: Center(
        child: Obx(() {
          switch (connectivityService.connectionStatus.value) {
            case ConnectivityStatus.connected:
              return HomePage();
            case ConnectivityStatus.disconnected:
              return Text('Disconnected from the internet');
            default:
              return CircularProgressIndicator(
                color: Colors.black,
              );
          }
        }),
      ),
    );
  }
}
