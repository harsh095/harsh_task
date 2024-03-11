import 'package:get/get.dart';
import 'package:harsh_task/Domain/Model/event_model.dart';

import '../Domain/Apis/Api_Client.dart';

class EventController extends GetxController
{
  final model=EventModel().obs;
  RxBool islod=true.obs;

  void getData(String Url)
  {
    ApiClient().fetchGet(Url.toString()).then((value)
    {
      model.value=EventModel.fromJson(value);
      islod.value=false;
    });
  }
}