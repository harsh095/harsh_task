import 'package:get/get.dart';
import 'package:harsh_task/Controller/homepage_controller.dart';

import '../../Controller/contectivity_controller.dart';
import '../../Controller/event_controller.dart';
import '../../Controller/subscription_controller.dart';

class AppBinding implements Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<ConnectivityService>(() => ConnectivityService());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SubcriptionController>(() => SubcriptionController());
    Get.lazyPut<EventController>(() => EventController());

  }
}