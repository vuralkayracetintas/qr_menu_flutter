enum ImageConstants {
  logo('brand_logo');

  final String value;
  // ignore: sort_constructors_first
  const ImageConstants(this.value);

  String get toPng => 'assets/images/$value.png';
}
