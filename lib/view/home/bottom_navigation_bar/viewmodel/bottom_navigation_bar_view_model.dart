import 'package:flutter/material.dart';

import '../../../../core/base/model/base_view_model.dart';

class BottomNavigationBarViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) => this.context = context;

  int pageIndex = 0;

  void changeIndex(int index){
    pageIndex = index;
    notifyListeners();
  }

}
