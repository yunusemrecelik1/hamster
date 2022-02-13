import 'package:flutter/material.dart';
import 'package:hamster/core/base/model/base_view_model.dart';
import 'package:hamster/view/home/profile/model/user_model.dart';
import 'package:hamster/view/home/profile/service/IUserService.dart';
import 'package:hamster/view/home/profile/service/get_user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/init/network/firebase_network/firebase_network_manager.dart';

class ProfileViewModel extends ChangeNotifier with BaseViewModel {

  bool switchNotification = true;
  bool switchLocation = true;
  bool isLoading = true;
  late IUserService userService;
  UserModel user = UserModel();
  @override
  void init() {
    userService = GetUserService(FirebaseNetworkManager.instance);
    getUser();
  }

  @override
  void setContext(BuildContext context) => this.context = context;

  Future<void> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var myUserId = prefs.get("userId");
    final result = await userService.getUser(myUserId.toString());
    if(result != null){
      user = result;
    }
    changeLoading();
  }
  changeLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }
}
