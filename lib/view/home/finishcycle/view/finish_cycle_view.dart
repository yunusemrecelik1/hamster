import 'package:flutter/material.dart';
import 'package:hamster/core/base/view/base_widget.dart';
import 'package:hamster/core/components/auto_size_text/auto_size_text.dart';
import 'package:hamster/core/constants/image/image_constants.dart';
import 'package:hamster/core/extension/context_extension.dart';
import 'package:hamster/core/init/theme/color_palette.dart';
import 'package:hamster/view/home/finishcycle/modelview/finish_cycle_model_view.dart';
import 'package:hamster/view/home/usingcycle/modelview/using_cycle_model_view.dart';

class FinishCycleView extends StatefulWidget {
  const FinishCycleView({Key? key}) : super(key: key);

  @override
  State<FinishCycleView> createState() => _FinishCycleViewState();
}

class _FinishCycleViewState extends State<FinishCycleView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<FinishCycleModelView>(
      viewModel: FinishCycleModelView(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, FinishCycleModelView value) => Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: context.height * 0.1,
              left: context.width * 0.4,
              width: context.width * 0.2,
              height: context.height * 0.075,
              child: Image.asset(
                ImageConstants.instance!.toPng("usingcycle"),
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: context.height * 0.2,
              left: context.width * 0.45,
              width: context.width * 0.075,
              height: context.height * 0.03,
              child: Image.asset(
                ImageConstants.instance!.toPng("horizantalelectric"),
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: context.height * 0.3,
              left: context.width * 0.32,
              child: Container(
                width: context.width * 0.34,
                height: context.height * 0.34,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorPalette.instance.mapLocationColorCircle1,
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    // ignore: prefer_const_constructors
                    BoxShadow(
                        color: const Color(0xff17A398),
                        blurRadius: 1,
                        spreadRadius: 1),
                  ],
                  image: DecorationImage(
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                    image: AssetImage(ImageConstants.instance!.toPng("circle")),
                  ),
                ),
                child: AppText(
                  myText: "0 Watt",
                  normalFontSize: 28,
                  color: ColorPalette.instance.appWhite,
                  fontWeight: FontWeight.w700,
                  maxLines: 2,
                ),
              ),
            ),
            Positioned(
              top: context.height * 0.65,
              left: context.width * 0.3,
              child: AppText(
                myText: "Elektrik ??retildi",
                color: ColorPalette.instance.appBlack,
                normalFontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            Positioned(
              width: context.width * 0.6,
              top: context.height * 0.74,
              left: context.width * 0.15,
              child: AppText(
                myText:
                    "??statistikler sayfas??ndan kazand??????n??z miktara bakabilirsiniz",
                color: ColorPalette.instance.appBlack,
                normalFontSize: 12,
                fontWeight: FontWeight.w700,
                maxLines: 2,
              ),
            ),
            Positioned(
              top: context.height * 0.85,
              left: context.width * 0.35,
              width: context.width * 0.35,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorPalette.instance.appBlack,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: FlatButton(
                  onPressed: () {},
                  child: AppText(
                    myText: "??statistikler",
                    normalFontSize: 14,
                    color: ColorPalette.instance.appWhite,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
