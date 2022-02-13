import 'package:hamster/view/home/profile/model/user_model.dart';

import '../../../../core/init/network/firebase_network/IFirebaseNetworkManager.dart';
import 'IUserService.dart';

class GetUserService  extends IUserService{
  GetUserService(IFirebaseNetworkManager manager) : super(manager);

  @override
  Future<UserModel?> getUser(String userId) async{
    final result = manager.getUser(userId);
    return result;
  }

}
