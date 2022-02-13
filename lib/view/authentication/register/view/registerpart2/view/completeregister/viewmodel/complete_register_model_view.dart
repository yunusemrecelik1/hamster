import 'package:flutter/cupertino.dart';
import 'package:hamster/core/base/model/base_view_model.dart';
import 'package:hamster/core/constants/navigation/navigation_constants.dart';
import 'package:hamster/core/init/navigation/navigation_service.dart';

class CompleteRegisterModelView extends ChangeNotifier with BaseViewModel {
  @override
  void init() {}

  @override
  void setContext(BuildContext context) => this.context;

  void goMobileVerify() {
    NavigationService.instance.navigateToPage(
      path: NavigationConstants.mobileverify,
    );
  }
}
