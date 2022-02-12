import 'package:hamster/view/authentication/login/model/login_model.dart';
import 'package:hamster/view/home/profile/model/user_model.dart';

abstract class IFirebaseNetworkManager {
  Future<UserModel?> getUser(String userId);
  Future<UserModel?> loginService(LoginModel model);
}