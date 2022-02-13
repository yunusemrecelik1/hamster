import 'package:flutter/material.dart';
import 'package:hamster/core/extension/context_extension.dart';
import 'package:hamster/core/init/theme/color_palette.dart';

import '../../../../core/base/view/base_widget.dart';
import '../../findhamster/view/find_hamster_view.dart';
import '../../profile/view/profile_view.dart';
import '../../statistics/view/statistics_view.dart';
import '../viewmodel/bottom_navigation_bar_view_model.dart';
import 'package:animations/animations.dart';

class BottomNavigationBarPage extends StatelessWidget {
  const BottomNavigationBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<BottomNavigationBarViewModel>(
      viewModel: BottomNavigationBarViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, BottomNavigationBarViewModel value) => Container(
        color: Colors.white,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            bottomNavigationBar: buildBottomNavigationBar(context, value),
            body: animatedBody(value),
          ),
        ),
      ),
    );
  }

  PageTransitionSwitcher animatedBody(BottomNavigationBarViewModel value) {
    return PageTransitionSwitcher(
      transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
          FadeThroughTransition(
        animation: primaryAnimation,
        secondaryAnimation: secondaryAnimation,
        child: child,
      ),
      child: [
        const FindHamsterView(),
        const StatisticsView(),
        const ProfileView(),
      ][value.pageIndex],
    );
  }

//
  Padding buildBottomNavigationBar(
      BuildContext context, BottomNavigationBarViewModel value) {
    return Padding(
      padding: context.paddingLowBottom,
      child: FittedBox(
        child: Container(
          width: context.width,
          padding:
              context.paddingMediumHorizontal + context.paddingNormalHorizontal,
          decoration: buildBoxDecoration(context),
          child: buildElements(value, context),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
      color: ColorPalette.instance.bottomNavColor,
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF919191).withOpacity(0.22),
          blurRadius: 15,
          offset: const Offset(0, -3),
        ),
      ],
    );
  }

  Row buildElements(BottomNavigationBarViewModel value, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildIcon(
            value: value,
            icon: value.pageIndex == 0 ? Icons.home : Icons.home_outlined,
            pageIndex: 0,
            context: context),
        buildIcon(
            value: value,
            icon: value.pageIndex == 1 ? Icons.map : Icons.map_outlined,
            pageIndex: 1,
            context: context),
        buildIcon(
            value: value,
            icon: value.pageIndex == 2 ? Icons.person : Icons.person_outline,
            pageIndex: 2,
            context: context),
      ],
    );
  }

  Widget buildIcon(
      {required BottomNavigationBarViewModel value,
      required int pageIndex,
      required IconData icon,
      required BuildContext context}) {
    return InkWell(
        onTap: () {
          value.changeIndex(pageIndex);
        },
        child: Column(
          children: [
            const SizedBox(height: 15),
            Icon(
              icon,
              color: ColorPalette.instance.iconBlack,
              size: 30,
            ),
            const SizedBox(height: 15),
          ],
        ));
  }
}
