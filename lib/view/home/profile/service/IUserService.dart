import 'package:hamster/view/home/profile/model/user_model.dart';

import '../../../../core/init/network/firebase_network/IFirebaseNetworkManager.dart';

abstract class IUserService {
  final IFirebaseNetworkManager manager;

  IUserService(this.manager);
  Future<UserModel?> getUser(String userId);
}