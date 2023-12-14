const String baseImagePath = 'assets/images/';
const String baseIconSvgPath = 'assets/svg/';

// extension function to choose image file format
extension ImageExtension on String {
  String get svg => '$baseIconSvgPath$this.svg';
  String get png => '$baseImagePath$this.png';
}

class AppImages {
  static final String profile = 'profile'.png;
}

class AppIconSvgs {
  static final String logo = 'logo'.svg;
  static final String arrowDown = 'arrow_down'.svg;
  static final String arrowUp = 'arrow_up'.svg;
  static final String brandName = 'brand_name'.svg;
  static final String btc = 'btc'.svg;
  static final String clock = 'clock'.svg;
  static final String globe = 'globe'.svg;
  static final String menu = 'menu'.svg;
  static final String menu2 = 'menu2'.svg;
  static final String usdt = 'usdt'.svg;
  static final String carratDown = 'carrat_down'.svg;
  static final String expand = 'expand'.svg;
}

