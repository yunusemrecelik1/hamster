import 'package:flutter/material.dart';
import 'package:hamster/core/base/model/base_view_model.dart';
import 'package:hamster/core/constants/navigation/navigation_constants.dart';
import 'package:hamster/core/init/navigation/navigation_service.dart';
import 'package:hamster/core/init/network/firebase_network/firebase_network_manager.dart';
import 'package:hamster/view/authentication/register/_service/IRegisterService.dart';
import 'package:hamster/view/authentication/register/_service/register_service.dart';
import 'package:hamster/view/authentication/register/model/register_model.dart';

class RegisterViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void init() {
    registerService = RegisterService(FirebaseNetworkManager.instance);
  }

  @override
  void setContext(BuildContext context) => this.context = context;
  late IRegisterService registerService;
  RegisterModel model = RegisterModel();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isAsyncCall = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordAgainController = TextEditingController();
  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  loginButton() {
    NavigationService.instance.navigateToPage(
      path: NavigationConstants.loginPage,
    );
  }

  signupButton() async {
    if(validateAndSave()){
      model = RegisterModel(mail: emailController.text,password: passwordController.text);
      final result = await registerService.fetchUser(model);
      if(result != ""){
        model.uId = result.toString();
        NavigationService.instance.navigateToPage(
          path: NavigationConstants.registerPageContinue,
          data: model,
        );
      }
    }
  }
}
