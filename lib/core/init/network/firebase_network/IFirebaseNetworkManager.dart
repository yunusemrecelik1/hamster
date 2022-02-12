import 'package:hamster/view/home/profile/model/user_model.dart';

abstract class IFirebaseNetworkManager {
  Future<UserModel?> getUser(String userId);
}