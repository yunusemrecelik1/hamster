import 'package:hamster/core/init/network/firebase_network/IFirebaseNetworkManager.dart';
import 'package:hamster/view/authentication/login/model/login_model.dart';
import 'package:hamster/view/authentication/login/service/ILoginService.dart';

class LoginService extends ILoginService {
  LoginService(IFirebaseNetworkManager manager) : super(manager);

  @override
  Future<bool?> loginUser(LoginModel model) async{
    final result = manager.loginService(model);
    return result;
  }
}