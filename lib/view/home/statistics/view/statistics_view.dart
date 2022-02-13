import 'package:flutter/material.dart';
import 'package:hamster/core/base/view/base_widget.dart';
import 'package:hamster/core/init/theme/color_palette.dart';
import 'package:hamster/view/home/statistics/viewmodel/statistics_view_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../core/extension/context_extension.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<StatisticsViewModel>(
      viewModel: StatisticsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, StatisticsViewModel value) => Scaffold(
        appBar: AppBar(
          title: Text(
            "İstatistiklerim",
            style: context.textTheme.headline4
                ?.copyWith(fontWeight: FontWeight.w700, color: Colors.black),
          ),
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: context.paddingNormal,
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              buildText(context, "Mevcut Miktar"),
              const SizedBox(height: 20),
              buildMiktar(context),
              const SizedBox(height: 20),
              buildText(context, "Son Kullanılanlar"),
              const SizedBox(height: 20),
              buildSonKullanilanlar(context),
              const SizedBox(height: 20),
              buildText(context, "Toplam Gelir"),
              const SizedBox(height: 20),
              buildToplam(context),
              const SizedBox(height: 20),
              buildText(context, "Zaman Dağılımı"),
              const SizedBox(height: 20),
              buildChart(value),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildSonKullanilanlar(BuildContext context) {
    return Padding(
              padding: context.paddingNormalHorizontal,
              child: Column(
                children: const[
                ListTile(
                  title: Text("Toplu Taşıma"),
                  trailing: Text("55.50"),
                ),
                  ListTile(
                    title: Text("Market"),
                    trailing: Text("22.00"),
                  ),
                  ListTile(
                    title: Text("Taksi"),
                    trailing: Text("13.25"),
                  ),
                ],
              ),
            );
  }

  Padding buildMiktar(BuildContext context) {
    return Padding(
              padding: context.paddingMediumHorizontal,
              child: Card(
                color: ColorPalette.instance.lightGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(context.normalValue),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: context.paddingNormalVertical+context.paddingLowLeft,
                      child: const Text("15 KW",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 19),),
                    ),
                    Padding(
                      padding: context.paddingNormalVertical + context.paddingLowLeft,
                      child: const Text("15 TL",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 19),),
                    ),
                    Padding(
                      padding: context.paddingMid + context.paddingLowLeft,
                      child: const Icon(Icons.motorcycle,color: Colors.white,),
                    )
                  ],
                ),
              ),
            );
  }
  Padding buildToplam(BuildContext context) {
    return Padding(
      padding: context.paddingMediumHorizontal,
      child: Card(
        color: const Color(0xffF8D05D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.normalValue),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: context.paddingNormalVertical+context.paddingLowLeft,
              child: const Text("15 KW",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 19),),
            ),
            Padding(
              padding: context.paddingNormalVertical + context.paddingLowLeft,
              child: const Text("15 TL",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 19),),
            ),
            Padding(
              padding: context.paddingMid + context.paddingLowLeft,
              child: const Icon(Icons.motorcycle,color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }
  Text buildText(BuildContext context, String title) => Text(
        title,
        style: context.textTheme.titleLarge
            ?.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
      );

  SizedBox buildChart(StatisticsViewModel value) {
    return SizedBox(
      height: 500,
      width: 500,
      child: SfCircularChart(
        legend:
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
        series: <CircularSeries>[
          // Render pie chart
          PieSeries<AgeData, String>(
            dataSource: value.ageList,
            pointColorMapper: (AgeData data, _) => data.color,
            xValueMapper: (AgeData data, _) => data.age,
            yValueMapper: (AgeData data, _) => data.ageValue,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              color: Colors.blue,
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'LexendDeca'),
            ),
            strokeColor: Colors.white,
            strokeWidth: 1,
          ),
        ],
      ),
    );
  }
}
