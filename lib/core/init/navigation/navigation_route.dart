import 'package:flutter/material.dart';
import 'package:hamster/view/authentication/login/view/login_view.dart';
import 'package:hamster/view/home/findhamster/view/find_hamster_view.dart';
import 'package:hamster/view/home/mobileverify/view/mobile_verify_view.dart';
import 'package:hamster/view/splashscreen/view/splash_screen.dart';
import '../../../view/authentication/forgetpassword/view/forget_password_view.dart';
import '../../../view/authentication/register/registerpart1/view/register_view.dart';
import '../../../view/authentication/register/registerpart2/view/register_part2_view.dart';
import '../../../view/authentication/register/registerpart3/view/complete_register_view.dart';
import '../../../view/home/bottom_navigation_bar/view/bottom_navigation_bar_view.dart';
import '../../../view/home/statistics/view/statistics_view.dart';
import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.defaultPage:
        return normalNavigate(const SplashScreen());
      case NavigationConstants.loginPage:
        return normalNavigate(const LoginView());
      case NavigationConstants.registerPage:
        return normalNavigate(const RegisterView());
      case NavigationConstants.registerPageContinue:
        return normalNavigate(RegisterContinueView(model: args.arguments));
      case NavigationConstants.completeregister:
        return normalNavigate(const CompleteRegisterView());
      case NavigationConstants.mobileverify:
        return normalNavigate(const MobileVerifyView());
      case NavigationConstants.mapsection:
        return normalNavigate(const FindHamsterView());
      case NavigationConstants.home:
        return normalNavigate(const BottomNavigationBarPage());
      case NavigationConstants.forgetPassword:
        return normalNavigate(const ForgetPasswordView());
      case NavigationConstants.statisticsPage:
        return normalNavigate(const StatisticsView());
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
