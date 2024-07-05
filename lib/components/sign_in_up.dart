import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingInUp extends StatelessWidget {
  const SingInUp({
    super.key,
    required this.text,
    required this.action,
    this.onAction,
  });

  final String text;
  final String action;
  final void Function()? onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0XFF3B4054)),
        ),
        InkWell(
          onTap: onAction,
          child: Text(
            ' $action',
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0XFF3461FD)),
          ),
        )
      ],
    );
  }
}
