import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildItem extends StatelessWidget {
  const BuildItem({
    super.key,
    required this.app,
    required this.icon,
    this.onTap,
  });

  final String app;
  final Widget icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 165,
        height: 60,
        decoration: BoxDecoration(
          color: const Color(0XFFF5F9FE),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 8),
            Text(
              app,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: const Color(0XFF61677D),
              ),
            )
          ],
        ),
      ),
    );
  }
}
