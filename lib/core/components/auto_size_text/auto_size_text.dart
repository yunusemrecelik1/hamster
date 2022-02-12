import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AppText extends StatelessWidget {
  final String myText;
  final double? minFontSize;
  final double? maxFontSize;
  final double? normalFontSize;
  final String? fontFamily;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final double? letterSpacing;
  const AppText({
    Key? key,
    required this.myText,
    this.minFontSize,
    this.maxFontSize,
    this.normalFontSize,
    this.fontFamily,
    this.color,
    this.fontWeight,
    this.maxLines,
    this.letterSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      myText,
      style: TextStyle(
        letterSpacing: letterSpacing ?? 0,
        color: color ?? Colors.black,
        fontSize: normalFontSize ?? 12,
        fontFamily: fontFamily ?? "Mulish",
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      minFontSize: minFontSize ?? 12,
      maxFontSize: maxFontSize ?? double.infinity,
      maxLines: maxLines,
    );
  }
}
