import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harsh_task/Screen/event_page.dart';
import 'package:harsh_task/Widgets/list_widget.dart';

import '../Controller/subscription_controller.dart';




class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key,required this.link});
  final String link;

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  SubcriptionController controller = Get.find<SubcriptionController>();

  @override
  void initState() {
    controller.getData(widget.link);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Obx(()
    {
      return Scaffold(
        appBar: AppBar(
          title: Text( "Subscription Page"),
          backgroundColor: Colors.black26,
        ),
        body: controller.islod.value==false?ListView.builder(
            itemCount: controller.model.value.data!.length,
            itemBuilder: (context,index){
          return InkWell(
            onTap: ()
            {

              Navigator.push(context, MaterialPageRoute(builder: (context)=> EventPage(link: controller.model.value.data![index].owner!.receivedEventsUrl.toString(),)));
            },
            child: ListWidget(controller.model.value.data![index].owner!.avatarUrl.toString(),"Id : "+controller.model.value.data![index].id.toString(),"Name : "+controller.model.value.data![index].name.toString()),

          );
        }):Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      );
    });
  }
}
