// ignore_for_file: prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hamster/core/base/view/base_widget.dart';
import 'package:hamster/core/components/auto_size_text/auto_size_text.dart';
import 'package:hamster/core/constants/image/image_constants.dart';
import 'package:hamster/core/extension/context_extension.dart';
import 'package:hamster/core/init/theme/color_palette.dart';

import '../viewmodel/complete_register_model_view.dart';

class CompleteRegisterView extends StatelessWidget {
  const CompleteRegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CompleteRegisterModelView>(
      viewModel: CompleteRegisterModelView(),
      onPageBuilder: (context, CompleteRegisterModelView value) => Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Stack(
                  fit: StackFit.loose,
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                      top: -100,
                      left: -50,
                      width: context.width * 0.8,
                      height: context.height * 0.8,
                      child: Image.asset(
                        ImageConstants.instance!.toPng("backgroundworkers1"),
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    Positioned(
                      top: -175,
                      right: -50,
                      width: context.width * 0.8,
                      height: context.height * 0.8,
                      child: Image.asset(
                        ImageConstants.instance!.toPng("backgroundworkersdeep"),
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    Positioned(
                      top: -60,
                      right: 50,
                      width: context.width * 0.8,
                      height: context.height * 0.8,
                      child: Image.asset(
                        ImageConstants.instance!.toPng("backgroundonly"),
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    Positioned(
                      top: -60,
                      right: 50,
                      width: context.width * 0.8,
                      height: context.height * 0.8,
                      child: Image.asset(
                        ImageConstants.instance!.toPng("backcycle"),
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: context.paddingMediumHorizontal,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const AppText(
                      myText: "Tebrikler Hazırsınız,",
                      fontWeight: FontWeight.w800,
                      minFontSize: 24,
                      maxFontSize: 36,
                      normalFontSize: 28,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: context.paddingMediumHorizontal,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const AppText(
                      myText: "Hadi Başlayalım!",
                      fontWeight: FontWeight.w800,
                      minFontSize: 24,
                      maxFontSize: 36,
                      normalFontSize: 28,
                    ),
                  ),
                ),
              ),
              Container(
                width: context.width * 0.25,
                height: context.height * 0.075,
                decoration: BoxDecoration(
                  color: ColorPalette.instance.appBlack,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: FlatButton(
                  onPressed: () => value.navigateLogin(),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: ColorPalette.instance.appWhite,
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
    );
  }
}
