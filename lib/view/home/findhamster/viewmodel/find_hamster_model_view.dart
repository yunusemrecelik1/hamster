// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hamster/core/base/model/base_view_model.dart';
import 'package:hamster/core/constants/navigation/navigation_constants.dart';
import 'package:hamster/core/init/navigation/navigation_service.dart';

class FindHamsterModelView extends ChangeNotifier with BaseViewModel {
  @override
  void init() {
    determinePosition();
  }

  @override
  void setContext(BuildContext context) => this.context;
  double locationLongitude = 38.963745;
  double locationLatitude = 35.243320;
  late Position position;
  Future<void> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Servis Dışı');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('İzin Verilmedi');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('İzin Verilmedi');
    }
    position = await Geolocator.getCurrentPosition();
    locationLatitude = position.latitude;
    locationLongitude = position.longitude;
    notifyListeners();
  }

  void startButton() {
    NavigationService.instance.navigateToPage(
      path: NavigationConstants.home,
    );
  }
}
