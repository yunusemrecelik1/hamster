import 'package:flutter/material.dart';
import 'package:hamster/core/base/model/base_view_model.dart';

class StatisticsViewModel extends ChangeNotifier with BaseViewModel {
  @override
  void init() {
    generateData();
  }

  @override
  void setContext(BuildContext context) => this.context = context;
  List<AgeData> ageList = [];

  void generateData(){
    ageList = [
      AgeData("Ocak", 2,
          const Color(0xfff5ce01)),
      AgeData("Şubat", 6,
          const Color(0xffff3d60)),
      AgeData("Mart",3,
          const Color(0xff3e97ff)),
      AgeData("Nisan", 54,
          const Color(0xff08d1ad)),
      AgeData("Mayıs", 31,
          const Color(0xff844aff)),
    ];
  }
}
class AgeData {
  AgeData(this.age, this.ageValue, this.color);
  final String age;
  final int? ageValue;
  final Color color;
}