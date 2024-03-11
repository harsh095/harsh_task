import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harsh_task/Widgets/list_widget.dart';

import '../Controller/event_controller.dart';
import '../Controller/subscription_controller.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key,required this.link});
  final String link;

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  EventController controller = Get.find<EventController>();

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
          title: Text( "Event Page"),
          backgroundColor: Colors.black26,
        ),
        body: controller.islod.value==false?ListView.builder(
            itemCount: controller.model.value.data!.length,
            itemBuilder: (context,index){
              return InkWell(
                onTap: ()
                {

                },
                child: ListWidget(controller.model.value.data![index].actor!.avatarUrl.toString(),"Id : "+controller.model.value.data![index].id.toString(),"Type : "+controller.model.value.data![index].type.toString()),

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

