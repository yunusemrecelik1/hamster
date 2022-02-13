import 'package:flutter/cupertino.dart';
import 'package:hamster/core/base/model/base_view_model.dart';

class ForgetPassVerificationModelView extends ChangeNotifier
    with BaseViewModel {
  @override
  void init() {
    // TODO: implement init
  }
  bool isAsyncCall = false;
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  @override
  void setContext(BuildContext context) => this.context = context;
}
