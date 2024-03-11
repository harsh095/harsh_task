import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  var connectionStatus = Rx<ConnectivityStatus>(ConnectivityStatus.unknown);

  @override
  void onInit() {
    super.onInit();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.wifi:
        case ConnectivityResult.mobile:
          connectionStatus.value = ConnectivityStatus.connected;

          break;
        case ConnectivityResult.none:
          connectionStatus.value = ConnectivityStatus.disconnected;
          Get.defaultDialog(
              title: "Internet Not Connect!",
              middleText: "Please Connect with internet",
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('OK'),
                ),
              ]);

          break;
        default:
          Get.defaultDialog(
            title: "Internet Not Connect!",
            middleText: "Please Connect with internet",
          );
          break;
      }
    });
  }
}

enum ConnectivityStatus {
  connected,
  disconnected,
  unknown,
}
