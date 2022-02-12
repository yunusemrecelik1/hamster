import 'package:flutter/material.dart';
import 'package:hamster/core/base/model/base_view_model.dart';

class ProfileViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) => this.context = context;

}
