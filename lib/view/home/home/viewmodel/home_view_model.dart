import 'package:flutter/material.dart';
import 'package:hamster/core/base/model/base_view_model.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomeViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) => this.context = context;
  final qrKey = GlobalKey(debugLabel: 'QR');
}
