// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hamster/core/base/model/base_view_model.dart';
import 'package:hamster/core/constants/navigation/navigation_constants.dart';
import 'package:hamster/core/init/navigation/navigation_service.dart';

class FindHamsterModelView extends ChangeNotifier with BaseViewModel {
  @override
  void init() {
    getCurrentLocation();
  }

  @override
  void setContext(BuildContext context) => this.context;
  double locationLongitude = 38.963745;
  double locationLatidude = 35.243320;
  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    locationLongitude = position.longitude;
    locationLatidude = position.latitude;
    notifyListeners();
  }

  void startButton() {
    NavigationService.instance.navigateToPage(
      path: NavigationConstants.home,
    );
  }
}
