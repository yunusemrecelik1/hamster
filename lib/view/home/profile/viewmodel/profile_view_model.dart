import 'package:flutter/material.dart';
import 'package:hamster/core/base/model/base_view_model.dart';
import 'package:hamster/view/home/profile/service/IUserService.dart';
import 'package:hamster/view/home/profile/service/get_user_service.dart';

import '../../../../core/init/network/firebase_network/firebase_network_manager.dart';

class ProfileViewModel extends ChangeNotifier with BaseViewModel {

  bool switchNotification = true;
  bool switchLocation = true;
  late IUserService userService;
  @override
  void init() {
    userService = GetUserService(FirebaseNetworkManager.instance);
  }

  @override
  void setContext(BuildContext context) => this.context = context;

  Future<void> getUser() async {
    final result = await userService.getUser("test");
    if(result?.name != null){
      /// BURADA DBDEN VERİ ÇEKME İŞLEMİ GERÇEKLEŞTİ KULLANICININ NAME'I YAZDI DAHA SONRASINDA DİNAMİK HALE GETİRİLECEK!
      print("agali ${result!.name}");
    }
  }
}
