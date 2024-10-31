class Assets {
  static String get basketball => 'Property 1=basketball'.svg;

  static String get football => 'Property 1=football'.svg;

  static String get soccer => 'Property 1=soccer'.svg;

  static String get loading => 'loading'.svg;
  static String get close => 'close'.svg;
  static String get download => 'Download'.svg;
  static String get share => 'share'.svg;

  static String get home => 'home-2'.svg;
  static String get fav => 'heart'.svg;
  static String get favFilled => 'heart_filled'.svg;

  static String get settings => 'setting-2'.svg;

  static String get arrowRight => 'arrow-left'.svg;
  static String get arrowLeft => 'arrow-left-1'.svg;

  static String get info => 'links'.json;

  const Assets._();
}

extension on String {
  String get svg => 'assets/svg/$this.svg';
  String get png => 'assets/images/$this.png';
  String get json => 'assets/json/$this.json';
}
