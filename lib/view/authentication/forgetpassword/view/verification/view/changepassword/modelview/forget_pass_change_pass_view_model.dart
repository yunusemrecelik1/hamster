import 'package:flutter/cupertino.dart';
import 'package:hamster/core/base/model/base_view_model.dart';

class ChangePasswordModelView extends ChangeNotifier with BaseViewModel {
  @override
  void init() {
    // TODO: implement init
  }
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  bool isAsyncCall = false;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  @override
  void setContext(BuildContext context) => this.context = context;
}
