import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextDesc extends StatelessWidget {
  const TextDesc({
    super.key,
    required this.desc,
  });

  final String desc;

  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: const Color(0XFF61677D)),
    );
  }
}
