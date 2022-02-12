import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hamster/view/home/profile/model/user_model.dart';
import 'IFirebaseNetworkManager.dart';

class FirebaseNetworkManager extends IFirebaseNetworkManager {
  static FirebaseNetworkManager? _instance;

  static FirebaseNetworkManager get instance =>
      _instance ??= FirebaseNetworkManager._init();

  FirebaseNetworkManager._init();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<UserModel?> getUser(String userId) async{
    final data = await firestore.collection('user').doc(userId).get();
    UserModel model = UserModel();
    var result = model.fromJson(data.data()!);
    print(result.name);
    return result;
  }


}