import 'package:flutter/material.dart';
import 'package:hamster/view/authentication/forgetpassword/view/forget_password_view.dart';
import 'package:hamster/view/authentication/forgetpassword/view/verification/view/changepassword/view/forget_pass_change_view.dart';
import 'package:hamster/view/authentication/forgetpassword/view/verification/view/forget_pass_verification_view.dart';
import 'package:hamster/view/authentication/login/view/login_view.dart';
import 'package:hamster/view/authentication/register/view/register_view.dart';
import 'package:hamster/view/authentication/register/view/registerpart2/view/completeregister/view/complete_register_view.dart';
import 'package:hamster/view/authentication/register/view/registerpart2/view/register_part2_view.dart';
import 'package:hamster/view/home/findhamster/view/find_hamster_view.dart';
import 'package:hamster/view/home/finishcycle/view/finish_cycle_view.dart';

import 'package:hamster/view/home/mobileverify/view/mobile_verify_view.dart';
import 'package:hamster/view/home/usingcycle/view/using_cycle_view.dart';
import 'package:hamster/view/splashscreen/view/splash_screen.dart';
import '../../../view/home/bottom_navigation_bar/view/bottom_navigation_bar_view.dart';
import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.defaultPage:
        return normalNavigate(const ChangePasswordView());
      case NavigationConstants.loginPage:
        return normalNavigate(const LoginView());

      case NavigationConstants.registerPage:
        return normalNavigate(const RegisterView());
      case NavigationConstants.registerPageContinue:
        return normalNavigate(const RegisterContinueView());
      case NavigationConstants.completeregister:
        return normalNavigate(const CompleteRegisterView());
      case NavigationConstants.mobileverify:
        return normalNavigate(const MobileVerifyView());
      case NavigationConstants.mapsection:
        return normalNavigate(const FindHamsterView());
      case NavigationConstants.home:
        return normalNavigate(const BottomNavigationBarPage());
      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
