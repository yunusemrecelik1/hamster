import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hamster/view/authentication/login/model/login_model.dart';
import 'package:hamster/view/authentication/register/model/register_model.dart';
import 'package:hamster/view/home/profile/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  Future<bool?> loginService(LoginModel model) async {
    UserModel userModel = UserModel();
    bool isSuccess = false;
    try{
      final result = await auth.signInWithEmailAndPassword(
          email: model.email ?? "", password: model.password ?? "");
      User? user = result.user;
      assert(user != null);
      String uId = user!.uid;

      QuerySnapshot querySnapshot = await firestore
          .collection("user")
          .where("uId", isEqualTo: uId)
          .get();

      if(querySnapshot.docs.isNotEmpty){
        String userId = querySnapshot.docs[0].id;
        userModel = userModel.fromJson(querySnapshot.docs.first.data() as Map<String,dynamic>);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("userId", userId);
        isSuccess = true;
      }
      else {
        isSuccess = false;
        Fluttertoast.showToast(
            msg: "Kullanıcı bulunamadı",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }
    catch(e){
      isSuccess = false;
      Fluttertoast.showToast(
          msg: "Giriş Başarısız",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    return isSuccess;
  }

  @override
  Future<String?> fetchUser(RegisterModel model) async{
    String userId = "";
    try {
      final result = await auth.createUserWithEmailAndPassword(email: model.mail ?? "",password: model.password ?? "");
      if(result.user != null) {
        userId = result.user!.uid;
      }
    }catch(e){
      print(e);
    }

    return userId;
  }

  @override
  Future<bool?> fetchUserToFirebase(Map<String,dynamic> data) async{
    bool isDone = false;
    try{
      await firestore.collection('user').doc().set(data);
      isDone = true;
    }catch(e){isDone = false;}

    return isDone;
  }
}