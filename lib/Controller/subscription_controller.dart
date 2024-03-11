import 'package:get/get.dart';
import 'package:harsh_task/Domain/Apis/Api_Client.dart';
import 'package:harsh_task/Domain/Model/subscription_model.dart';

import '../Domain/Model/home_model.dart';

class SubcriptionController extends GetxController
{


  final model=SubscriptionModel().obs;
  RxBool islod=true.obs;

  void getData(String Url)
  {
    ApiClient().fetchGet(Url.toString()).then((value)
    {
     model.value=SubscriptionModel.fromJson(value);
     islod.value=false;
    });
  }
}