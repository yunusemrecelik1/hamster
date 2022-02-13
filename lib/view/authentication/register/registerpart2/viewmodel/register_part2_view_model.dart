import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hamster/core/base/model/base_view_model.dart';
import 'package:hamster/core/constants/navigation/navigation_constants.dart';
import 'package:hamster/core/init/navigation/navigation_service.dart';
import 'package:hamster/view/authentication/register/model/register_model.dart';

import '../../../../../core/init/network/firebase_network/firebase_network_manager.dart';
import '../../_service/IRegisterService.dart';
import '../../_service/register_service.dart';

class RegisterContinueViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void init() {
    registerService = RegisterService(FirebaseNetworkManager.instance);
  }

  @override
  void setContext(BuildContext context) => this.context = context;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isAsyncCall = false;
  late IRegisterService registerService;
  RegisterModel model = RegisterModel();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateBornController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  Future<void> continueButton(Object? regModel) async{
   if(validateAndSave()){
     isAsyncCall = true;
     model = regModel as RegisterModel;

     bool? result = await registerService.fetchUserToFirebase(
       RegisterModel(
           mail: model.mail,
           uId: model.uId,
           name: nameController.text,
           dateOfBirth: dateBornController.text,
           phoneNumber: mobileNumberController.text),
     );
     if(result != null && result){
       NavigationService.instance.navigateToPage(
         path: NavigationConstants.completeregister,
       );
     }
     else {
       Fluttertoast.showToast(
           msg: "Bir hata oluştu",
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.CENTER,
           timeInSecForIosWeb: 1,
           backgroundColor: Colors.red,
           textColor: Colors.white,
           fontSize: 16.0
       );
     }
     isAsyncCall = false;
     notifyListeners();
   }
  }

  signupButton() {
    NavigationService.instance.navigateToPage(
      path: NavigationConstants.loginPage,
    );
  }
}
