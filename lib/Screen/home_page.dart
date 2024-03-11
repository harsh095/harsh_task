import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harsh_task/Controller/homepage_controller.dart';
import 'package:harsh_task/Screen/subscription_page.dart';
import 'package:harsh_task/Widgets/list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    controller.CheckUser();
    _scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(scrollListener);
    super.dispose();
  }

  void scrollListener() {
    print("Scrolling...");
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      print("Reached end of scroll");
      if (controller.AddData()) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.black26,
      ),
      body: Center(
        child: Obx(() {
          return controller.islod == false
              ? FutureBuilder<List<Map<String, dynamic>>>(
                  future: controller.selectData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return CircularProgressIndicator(
                        color: Colors.black26,
                      );
                    return SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SubscriptionPage(
                                        link: snapshot.data![index]
                                                ['subscriptionsUrl']
                                            .toString(),
                                      ),
                                    ),
                                  );
                                },
                                child: ListWidget(
                                  snapshot.data![index]['avatarUrl'].toString(),
                                  "Id : " +
                                      snapshot.data![index]['id'].toString(),
                                  "Type : " +
                                      snapshot.data![index]['type'].toString(),
                                ),
                              );
                            },
                          ),
                          Obx(() {
                            return controller.callapi == true
                                ? CircularProgressIndicator(
                                    color: Colors.black,
                                  )
                                : Container();
                          })
                        ],
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(
                  color: Colors.black26,
                );
        }),
      ),
    );
  }
}
