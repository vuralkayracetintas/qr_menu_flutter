import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    required this.titleText,
    super.key,
  });
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: GoogleFonts.inter(
        textStyle: context.general.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
