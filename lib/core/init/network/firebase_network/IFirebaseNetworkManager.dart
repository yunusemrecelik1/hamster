import 'package:hamster/view/authentication/login/model/login_model.dart';
import 'package:hamster/view/authentication/register/model/register_model.dart';
import 'package:hamster/view/home/profile/model/user_model.dart';

abstract class IFirebaseNetworkManager {
  Future<UserModel?> getUser(String userId);
  Future<bool?> loginService(LoginModel model);
  Future<String?> fetchUser(RegisterModel model);
  Future<bool?> fetchUserToFirebase(Map<String,dynamic> data);
}