import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dot extends StatelessWidget {
  final IconData icon;
  final String label;
  final double position;

  const Dot(
      {Key? key,
      required this.icon,
      required this.label,
      required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4.0),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
