import 'package:hamster/core/init/network/firebase_network/IFirebaseNetworkManager.dart';
import 'package:hamster/view/authentication/login/model/login_model.dart';


abstract class ILoginService {
  final IFirebaseNetworkManager manager;
  ILoginService(this.manager);

  Future<bool?> loginUser(LoginModel model);
}