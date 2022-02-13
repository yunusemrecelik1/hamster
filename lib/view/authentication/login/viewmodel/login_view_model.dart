import 'package:flutter/material.dart';
import 'package:hamster/core/base/model/base_view_model.dart';
import 'package:hamster/core/constants/navigation/navigation_constants.dart';
import 'package:hamster/core/init/navigation/navigation_service.dart';
import 'package:hamster/core/init/network/firebase_network/firebase_network_manager.dart';
import 'package:hamster/view/authentication/login/model/login_model.dart';
import 'package:hamster/view/authentication/login/service/ILoginService.dart';
import 'package:hamster/view/authentication/login/service/login_service.dart';

class LoginViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void init() {
    loginService = LoginService(FirebaseNetworkManager.instance);
  }

  @override
  void setContext(BuildContext context) => this.context = context;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late ILoginService loginService;
  bool isAsyncCall = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  Future<void>loginButton() async{
    if (validateAndSave()) {
      isAsyncCall = true;
      LoginModel model = LoginModel(email: emailController.text,password: passwordController.text);
      final result = await loginService.loginUser(model);
      isAsyncCall = false;
      if(result != null && result){
        NavigationService.instance.navigateToPageClear(
          path: NavigationConstants.home,
        );
      }
    }
  }

  signupButton() {
    NavigationService.instance.navigateToPage(
      path: NavigationConstants.registerPage,
    );
  }
  forgetNavigate(){
    NavigationService.instance.navigateToPage(
      path: NavigationConstants.forgetPassword,
    );
  }
}
