import 'package:hamster/core/init/network/firebase_network/IFirebaseNetworkManager.dart';
import 'package:hamster/view/authentication/register/model/register_model.dart';

abstract class IRegisterService {
  final IFirebaseNetworkManager manager;
  IRegisterService(this.manager);

  Future<String?> fetchUser(RegisterModel model);
  Future<bool?> fetchUserToFirebase(RegisterModel model);
}