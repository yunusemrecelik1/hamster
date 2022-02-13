import 'package:flutter/cupertino.dart';
import 'package:hamster/core/base/model/base_view_model.dart';
import 'package:hamster/core/constants/navigation/navigation_constants.dart';
import 'package:hamster/core/init/navigation/navigation_service.dart';

class MobileVerifyModelView extends ChangeNotifier with BaseViewModel {
  @override
  void init() {
    // TODO: implement init
  }

  @override
  void setContext(BuildContext context) => this.context;

  okayButton() {
    NavigationService.instance.navigateToPage(
      path: NavigationConstants.mapsection,
    );
  }
}
