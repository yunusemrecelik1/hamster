import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hamster/core/base/view/base_widget.dart';
import 'package:hamster/core/components/auto_size_text/auto_size_text.dart';
import 'package:hamster/core/constants/image/image_constants.dart';
import 'package:hamster/core/extension/context_extension.dart';
import 'package:hamster/core/init/theme/color_palette.dart';
import 'package:hamster/view/home/findhamster/viewmodel/find_hamster_model_view.dart';
import 'package:latlong2/latlong.dart';

class FindHamsterView extends StatefulWidget {
  const FindHamsterView({Key? key}) : super(key: key);

  @override
  State<FindHamsterView> createState() => _FindHamsterViewState();
}

class _FindHamsterViewState extends State<FindHamsterView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 2.0, end: 15.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.stop();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<FindHamsterModelView>(
        viewModel: FindHamsterModelView(),
        onPageBuilder: (context, FindHamsterModelView value) => Scaffold(
              body: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    child: FlutterMap(
                      options: MapOptions(
                        center: LatLng(
                            value.locationLatitude, value.locationLongitude),
                        zoom: 10.0,
                        maxZoom: 18,
                        minZoom: 8,
                      ),
                      layers: [
                        TileLayerOptions(
                          urlTemplate:
                              "https://api.mapbox.com/styles/v1/hasabantov1999/ckyloe8370d9b14pen2u051j8/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaGFzYWJhbnRvdjE5OTkiLCJhIjoiY2t5bG85OTZxMnI1ejJ1cWhmaTkzd3F3ayJ9.YC8Jq-_1_NSOUcBnJd1Nsw",
                        ),
                        MarkerLayerOptions(markers: [
                          Marker(
                            width: 40,
                            height: 40,
                            point: LatLng(value.locationLatitude,
                                value.locationLongitude),
                            builder: (context) => Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorPalette
                                    .instance.mapLocationColorCircle1,
                                // ignore: prefer_const_literals_to_create_immutables
                                boxShadow: [
                                  // ignore: prefer_const_constructors
                                  BoxShadow(
                                      color: const Color(0xffF8D05D),
                                      blurRadius: _animation.value,
                                      spreadRadius: _animation.value),
                                ],
                                image: DecorationImage(
                                  alignment: Alignment.center,
                                  fit: BoxFit.contain,
                                  scale: 0.2,
                                  filterQuality: FilterQuality.high,
                                  image: AssetImage(
                                      ImageConstants.instance!.toPng("markme")),
                                ),
                              ),
                              child: Container(),
                            ),
                          ),
                        ])
                      ],
                    ),
                  ),
                  Positioned(
                    top: 30,
                    child: Row(
                      children: [
                        SizedBox(
                          width: context.width * 0.05,
                        ),
                        const AppText(
                          myText: "En yakın",
                          fontWeight: FontWeight.w900,
                          normalFontSize: 18,
                          letterSpacing: 0.2,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    width: context.width * 0.25,
                    height: context.height * 0.075,
                    top: 30,
                    right: 30,
                    child: Image.asset(
                      ImageConstants.instance!.toPng("maprectangle"),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    width: context.width * 0.25,
                    height: context.height * 0.075,
                    top: 30,
                    right: 0,
                    child: Image.asset(
                      ImageConstants.instance!.toPng("mapcircle"),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    width: 20,
                    height: 20,
                    top: 45,
                    right: 40,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      color: ColorPalette.instance.appBrown,
                    ),
                  ),
                  Positioned(
                      width: context.width * 0.25,
                      height: context.height * 0.075,
                      bottom: 40,
                      left: context.width * 0.4,
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                                ColorPalette.instance.verifiticationTextColor,
                            borderRadius: BorderRadius.circular(10)),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          onPressed: () => value.startButton(),
                          child: const AppText(
                            myText: "Başla",
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            normalFontSize: 14,
                          ),
                        ),
                      )),
                ],
              ),
            ),
        onModelReady: (model) {
          model.context = context;
          model.init();
        });
  }
}
