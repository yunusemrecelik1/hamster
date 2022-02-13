// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hamster/core/base/view/base_widget.dart';
import 'package:hamster/core/components/auto_size_text/auto_size_text.dart';
import 'package:hamster/core/extension/context_extension.dart';
import 'package:hamster/core/init/theme/color_palette.dart';
import 'package:hamster/product/components/radiustextformfield/radius_text_form_field.dart';
import 'package:hamster/view/authentication/forgetpassword/view/verification/viewmodel/forget_pass_verification_model_view.dart';
import 'package:hamster/view/authentication/forgetpassword/viewmodel/forget_password_model_view.dart';
import 'package:hamster/view/authentication/login/viewmodel/login_view_model.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgetPassVerificationView extends StatelessWidget {
  const ForgetPassVerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;
    return BaseView<ForgetPassVerificationModelView>(
      viewModel: ForgetPassVerificationModelView(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, ForgetPassVerificationModelView value) =>
          Scaffold(
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
                        flex: 2,
                        child: welcomeUpSide(),
                      ),
                      const Spacer(),
                      Padding(
                        padding: context.paddingMediumHorizontal,
                        child: informationText(),
                      ),
                      const Spacer(),
                      Padding(
                        padding: viewInsets,
                        child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.bounceInOut,
                            child: formBody(context, value)),
                      ),
                      Expanded(
                        flex: 6,
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

  Widget formBody(BuildContext context, ForgetPassVerificationModelView value) {
    return Padding(
      padding: context.paddingMediumHorizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(
                flex: 4,
              ),
              _textFieldOTP(first: true, last: false, context: context),
              const Spacer(),
              _textFieldOTP(first: false, last: false, context: context),
              const Spacer(),
              _textFieldOTP(first: false, last: false, context: context),
              const Spacer(),
              _textFieldOTP(first: false, last: false, context: context),
              const Spacer(),
              _textFieldOTP(first: false, last: true, context: context),
              const Spacer(
                flex: 4,
              ),
            ],
          ),
          SizedBox(
            height: context.height * 0.05,
          ),
          const SizedBox(
            height: 10,
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
              onPressed: () => null,
              child: AppText(
                myText: "Onayla",
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
          myText: "Şifrenizi Yenileyin",
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

  Row informationText() {
    return Row(
      children: [
        const Spacer(),
        const AppText(
          myText: "Lütfen onay kodunuzu giriniz.",
          normalFontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
        ),
        const Spacer(
          flex: 6,
        ),
      ],
    );
  }

  Widget _textFieldOTP({required bool first, last, context}) {
    return Container(
      height: 60,
      child: AspectRatio(
        aspectRatio: 0.8,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ColorPalette.instance.verifiticationTextColor),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            fillColor: ColorPalette.instance.verifiticationColor,
            filled: true,
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Color.fromARGB(31, 0, 0, 0)),
                borderRadius: BorderRadius.circular(5)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2, color: ColorPalette.instance.verifiticationColor),
                borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ),
    );
  }
}
