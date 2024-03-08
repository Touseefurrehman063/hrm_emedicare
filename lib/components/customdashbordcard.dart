import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Customdashboardcard extends StatelessWidget {
  String title;
  String count;
  Color shadowcolor;
  Color foregroundcolor;
  Customdashboardcard(
      {super.key,
      required this.title,
      required this.count,
      required this.shadowcolor,
      required this.foregroundcolor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01),
      child: Container(
        height: Get.height * 0.1,
        width: Get.width * 0.28,
        decoration: BoxDecoration(
            color: foregroundcolor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -5),
                color: shadowcolor,
              ),
            ]),
        child: Padding(
          padding: EdgeInsets.only(left: Get.width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.black45,
                  fontSize: Get.height * 0.02,
                ),
              ),
              Text(
                count,
                style: GoogleFonts.poppins(
                  fontSize: Get.height * 0.03,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
