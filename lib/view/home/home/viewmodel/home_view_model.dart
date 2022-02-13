import 'package:flutter/material.dart';
import 'package:hamster/core/base/model/base_view_model.dart';
import 'package:permission_handler/permission_handler.dart';


class HomeViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void init() {
    getCameraPermission();
  }

  @override
  void setContext(BuildContext context) => this.context = context;
  final qrKey = GlobalKey(debugLabel: 'QR');

  void getCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      final result = await Permission.camera.request();
      print(result);
    }
  }
}