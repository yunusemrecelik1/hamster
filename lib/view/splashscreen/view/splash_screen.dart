import 'package:flutter/material.dart';
import 'package:hamster/core/constants/image/image_constants.dart';
import 'package:hamster/core/constants/navigation/navigation_constants.dart';
import 'package:hamster/core/init/navigation/navigation_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateWithDelay();
    super.initState();
  }

  navigateWithDelay() {
    Future.delayed(
      const Duration(seconds: 5),
      () => NavigationService.instance.navigateToPageClear(
        path: NavigationConstants.loginPage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 1 / 3,
          child: Image.asset(
            ImageConstants.instance!.toGif("logoanimation"),
          ),
        ),
      ),
    );
  }
}
