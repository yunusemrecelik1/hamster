import 'package:flutter/material.dart';
import 'package:hamster/core/base/model/base_view_model.dart';
import 'package:hamster/core/constants/navigation/navigation_constants.dart';
import 'package:hamster/core/init/navigation/navigation_service.dart';

class RegisterContinueViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) => this.context = context;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isAsyncCall = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController dateBornController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();
  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  continueButton() {
    NavigationService.instance.navigateToPage(
      path: NavigationConstants.completeregister,
    );
  }

  signupButton() {
    NavigationService.instance.navigateToPage(
      path: NavigationConstants.loginPage,
    );
  }
}
