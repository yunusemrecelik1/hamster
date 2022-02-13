// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hamster/core/components/auto_size_text/auto_size_text.dart';
import 'package:hamster/core/constants/image/image_constants.dart';
import 'package:hamster/core/init/theme/color_palette.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../core/base/view/base_widget.dart';
import '../viewmodel/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  QRViewController? controller;
  Barcode? barcode;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, HomeViewModel value) => Scaffold(
        body: Stack(children: [
          buildQrView(context, value),
          Column(
            children: [
              Spacer(
                flex: 1,
              ),
              AppText(
                myText: "Taranıyor...",
                fontWeight: FontWeight.w700,
                normalFontSize: 24,
                color: ColorPalette.instance.appBlack,
              ),
              Spacer(
                flex: 1,
              ),
              AppText(myText: "Lütfen kodu kutucuğun içine yerleştirin."),
              Spacer(
                flex: 4,
              ),
              AspectRatio(
                aspectRatio: 3,
                child: Image.asset(
                  ImageConstants.instance!.toPng("scan"),
                ),
              ),
              Spacer(
                flex: 4,
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 0.1)),
                child: IconButton(
                  color: ColorPalette.instance.appWhite,
                  onPressed: () async {
                    await controller?.toggleFlash();
                    setState(() {});
                  },
                  icon: Image.asset(
                    ImageConstants.instance!.toPng("flash"),
                  ),
                ),
              ),
              Spacer(
                flex: 3,
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget buildQrView(BuildContext context, HomeViewModel value) => QRView(
        key: value.qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderWidth: 10,
          borderLength: 20,
          borderRadius: 10,
          borderColor: Theme.of(context).accentColor,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream
        .listen((barcode) => setState(() => this.barcode = barcode));
  }
}
