// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hamster/core/base/view/base_widget.dart';
import 'package:hamster/core/components/auto_size_text/auto_size_text.dart';
import 'package:hamster/core/extension/context_extension.dart';
import 'package:hamster/core/init/theme/color_palette.dart';
import 'package:hamster/view/authentication/register/view/registerpart2/viewmodel/register_part2_view_model.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../product/components/radiustextformfield/radius_text_form_field.dart';

class RegisterContinueView extends StatelessWidget {
  const RegisterContinueView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    return BaseView<RegisterContinueViewModel>(
      viewModel: RegisterContinueViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, RegisterContinueViewModel value) => Scaffold(
        body: SafeArea(
          child: Form(
            key: value.globalFormKey,
            child: ModalProgressHUD(
              inAsyncCall: value.isAsyncCall,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: SizedBox(
                  width: context.width,
                  height: context.height,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: welcomeUpSide(),
                      ),
                      Padding(
                        padding: viewInsets,
                        child: Expanded(
                          flex: 13,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.bounceInOut,
                            child: formBody(context, value),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget formBody(BuildContext context, RegisterContinueViewModel value) {
    return Padding(
      padding: context.paddingHighHorizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            myText: "Ad Soyad",
            color: ColorPalette.instance.loginTextColor,
            normalFontSize: 13,
            fontWeight: FontWeight.w600,
            minFontSize: 12,
            maxFontSize: 40,
            letterSpacing: 0,
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: context.width,
            child: RadiusFormFieldWidget(
              controller: value.nameController,
              validateText: "Ad soyad boş olamaz",
              suffix: false,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AppText(
            myText: "Doğum Tarihi",
            color: ColorPalette.instance.loginTextColor,
            normalFontSize: 13,
            fontWeight: FontWeight.w600,
            minFontSize: 12,
            maxFontSize: 40,
            letterSpacing: 0,
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: context.width,
            child: RadiusFormFieldWidget(
              keyboardType: TextInputType.number,
              inputFormatters: [
                MaskTextInputFormatter(
                    mask: "##/##/####", filter: {"#": RegExp(r'[0-9]')})
              ],
              controller: value.dateBornController,
              validateText: "Şifre boş olamaz",
              suffix: false,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AppText(
            myText: "Telefon Numarası",
            color: ColorPalette.instance.loginTextColor,
            normalFontSize: 13,
            fontWeight: FontWeight.w600,
            minFontSize: 12,
            maxFontSize: 40,
            letterSpacing: 0,
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: context.width,
            child: RadiusFormFieldWidget(
              keyboardType: TextInputType.number,
              controller: value.mobilenumberController,
              validateText: "Şifre Tekrarı boş olamaz",
              suffix: false,
              initialText: "Zorunlu Değildir",
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            width: context.width * 0.4,
            decoration: BoxDecoration(
              color: ColorPalette.instance.appBlack,
              borderRadius: BorderRadius.circular(5),
            ),
            // ignore: deprecated_member_use
            child: FlatButton(
              onPressed: () => value.continueButton(),
              child: AppText(
                myText: "Devam",
                color: ColorPalette.instance.appWhite,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Row welcomeUpSide() {
    return Row(
      children: [
        const Spacer(),
        const AppText(
          myText: "Devam Edelim",
          normalFontSize: 28,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
        const Spacer(
          flex: 6,
        ),
      ],
    );
  }
}
