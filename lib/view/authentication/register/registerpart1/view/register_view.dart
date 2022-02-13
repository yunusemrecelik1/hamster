// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hamster/core/base/view/base_widget.dart';
import 'package:hamster/core/components/auto_size_text/auto_size_text.dart';
import 'package:hamster/core/extension/context_extension.dart';
import 'package:hamster/core/init/theme/color_palette.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../product/components/radiustextformfield/radius_text_form_field.dart';
import '../viewmodel/register_view_model.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    return BaseView<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, RegisterViewModel value) => Scaffold(
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
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.bounceInOut,
                          child: formBody(context, value),
                        ),
                      ),
                      Expanded(
                        flex: 2,
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

  Widget formBody(BuildContext context, RegisterViewModel value) {
    return Padding(
      padding: context.paddingMediumHorizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            myText: "E-mail",
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
              controller: value.emailController,
              validateText: "Email boş olamaz",
              suffix: false,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AppText(
            myText: "Şifre",
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
              controller: value.passwordController,
              validateText: "Şifre boş olamaz",
              suffix: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AppText(
            myText: "Şifre Tekrar",
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
              controller: value.passwordAgainController,
              validateText: "Şifre Tekrarı boş olamaz",
              suffix: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: context.width,
            decoration: BoxDecoration(
              color: ColorPalette.instance.appBlack,
              borderRadius: BorderRadius.circular(5),
            ),
            // ignore: deprecated_member_use
            child: FlatButton(
              onPressed: () => value.signupButton(),
              child: AppText(
                myText: "Kayıt Ol",
                color: ColorPalette.instance.appWhite,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(children: <Widget>[
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: Divider(
                    color: ColorPalette.instance.dividerColor,
                    height: 36,
                    thickness: 1.5,
                  )),
            ),
            AppText(
              myText: "Veya",
              color: ColorPalette.instance.dividerColor,
            ),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Divider(
                    color: ColorPalette.instance.dividerColor,
                    thickness: 1.5,
                    height: 36,
                  )),
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: context.width,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: context.width * 0.3,
                decoration: BoxDecoration(
                  color: ColorPalette.instance.appBlack,
                  borderRadius: BorderRadius.circular(5),
                ),
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () => value.loginButton(),
                  child: AppText(
                    myText: "Giriş Yap",
                    color: ColorPalette.instance.appWhite,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
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
          myText: "Kayıt Ol",
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
