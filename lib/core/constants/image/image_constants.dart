// ignore_for_file: prefer_conditional_assignment

class ImageConstants {
  static ImageConstants? _instance;

  static ImageConstants? get instance {
    if (_instance == null) _instance = ImageConstants._init();
    return _instance;
  }

  ImageConstants._init();

  String get starbucks => toPng("starbucks");
  String get coffee_1 => toPng("coffee_1");
  String get coffee_2 => toPng("coffee_2");

  String toPng(String name) => "assets/images/$name.png";
  String toGif(String name) => "assets/gifs/$name.gif";
}
