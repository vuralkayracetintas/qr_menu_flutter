enum ImageConstants {
  logo('projecton_logo');

  final String value;
  // ignore: sort_constructors_first
  const ImageConstants(this.value);

  String get toPng => 'images/$value.png';
}
