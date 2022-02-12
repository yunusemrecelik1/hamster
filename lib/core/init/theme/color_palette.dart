import 'package:hamster/core/extension/string_extension.dart';

class ColorPalette {
  static ColorPalette? _instance;

  static ColorPalette get instance => _instance ??= ColorPalette._init();

  ColorPalette._init();

  final darkGreen = '0C8278'.colorPalette;
  final lightGreen = '3CD3C8'.colorPalette;
  final mainGreen = '17A398'.colorPalette;
  final appBlack = '242424'.colorPalette;
  final appBrown = '3D3D3D'.colorPalette;
  final appWhite = 'FFFFFF'.colorPalette;
  final bottomNavColor = 'F6F7FF'.colorPalette;
  final iconBlack = '000000'.colorPalette;
}