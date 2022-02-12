import 'package:flutter/material.dart';
import 'package:hamster/core/base/model/base_view_model.dart';

class ProfileViewModel extends ChangeNotifier with BaseViewModel {

  bool switchNotification = true;
  bool switchLocation = true;

  @override
  void init() {}

  @override
  void setContext(BuildContext context) => this.context = context;

}
