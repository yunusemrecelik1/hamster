
import 'package:hamster/core/init/network/firebase_network/IFirebaseNetworkManager.dart';
import 'package:hamster/view/authentication/register/_service/IRegisterService.dart';
import 'package:hamster/view/authentication/register/model/register_model.dart';

class RegisterService extends IRegisterService {
  RegisterService(IFirebaseNetworkManager manager) : super(manager);

  @override
  Future<String?> fetchUser(RegisterModel model) async{
    final result = await manager.fetchUser(model);
    return result;
  }

  @override
  Future<bool?> fetchUserToFirebase(RegisterModel model) async{
    Map<String,dynamic> data = model.toJson();
    final result = await manager.fetchUserToFirebase(data);
    return result;
  }


}