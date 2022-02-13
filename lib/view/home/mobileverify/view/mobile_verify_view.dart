// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_is_empty, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hamster/core/base/view/base_widget.dart';
import 'package:hamster/core/components/auto_size_text/auto_size_text.dart';
import 'package:hamster/core/constants/image/image_constants.dart';
import 'package:hamster/core/extension/context_extension.dart';
import 'package:hamster/core/init/theme/color_palette.dart';
import 'package:hamster/view/home/mobileverify/model/mobile_verify_model_view.dart';

class MobileVerifyView extends StatelessWidget {
  const MobileVerifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MobileVerifyModelView>(
        viewModel: MobileVerifyModelView(),
        onPageBuilder: (context, MobileVerifyModelView value) => Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          Spacer(),
                          Row(
                            children: [
                              const Spacer(
                                flex: 1,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                ),
                              ),
                              const Spacer(
                                flex: 2,
                              ),
                              const AppText(
                                myText: "Telefon Doğrulama",
                                fontWeight: FontWeight.w700,
                                normalFontSize: 18,
                              ),
                              const Spacer(
                                flex: 4,
                              )
                            ],
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          AspectRatio(
                            aspectRatio: 5 / 1.5,
                            child: Image.asset(
                              ImageConstants.instance!.toPng("cycle"),
                            ),
                          ),
                          const Spacer(
                            flex: 4,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Spacer(
                                flex: 4,
                              ),
                              _textFieldOTP(
                                  first: true, last: false, context: context),
                              const Spacer(),
                              _textFieldOTP(
                                  first: false, last: false, context: context),
                              const Spacer(),
                              _textFieldOTP(
                                  first: false, last: false, context: context),
                              const Spacer(),
                              _textFieldOTP(
                                  first: false, last: false, context: context),
                              const Spacer(),
                              _textFieldOTP(
                                  first: false, last: true, context: context),
                              const Spacer(
                                flex: 4,
                              ),
                            ],
                          ),
                          const Spacer(),
                          AppText(
                            myText: "Doğrulama kodunuz hâlâ gelmedi mi?",
                            color:
                                ColorPalette.instance.verificationTextSendColor,
                            fontWeight: FontWeight.w700,
                          ),
                          Spacer(
                            flex: 3,
                          ),
                          Container(
                            width: context.width * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  ColorPalette.instance.verifiticationTextColor,
                            ),
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              onPressed: () => value.okayButton(),
                              child: AppText(
                                myText: "Onayla",
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                normalFontSize: 14,
                              ),
                            ),
                          ),
                          Spacer(
                            flex: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        onModelReady: (model) {
          model.context = context;
          model.init();
        });
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
