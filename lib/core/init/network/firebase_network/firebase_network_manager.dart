import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hamster/view/authentication/login/model/login_model.dart';
import 'package:hamster/view/home/profile/model/user_model.dart';
import 'IFirebaseNetworkManager.dart';

class FirebaseNetworkManager extends IFirebaseNetworkManager {
  static FirebaseNetworkManager? _instance;

  static FirebaseNetworkManager get instance =>
      _instance ??= FirebaseNetworkManager._init();

  FirebaseNetworkManager._init();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<UserModel?> getUser(String userId) async {
    final data = await firestore.collection('user').doc(userId).get();
    UserModel model = UserModel();
    var result = model.fromJson(data.data()!);
    return result;
  }

  @override
  Future<UserModel?> loginService(LoginModel model) async {
    //eksik kaldı result yollanıp anasayfaya navigate falan olcak xd
    final result = await auth.signInWithEmailAndPassword(
        email: model.email ?? "", password: model.password ?? "");
    UserModel response = UserModel();
    return response;
  }
}
///
///  createUserWithEmailAndPassword email-password