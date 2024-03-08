import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

// ignore: must_be_immutable
class Customattandencestatuscard extends StatelessWidget {
  Color color;
  String title;
  String total;
  String count;
  Customattandencestatuscard(
      {super.key,
      required this.color,
      required this.title,
      required this.total,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.09,
      width: Get.width * 0.2,
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: Get.width * 0.018),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(Get.height * 0.01),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 15.h,
                    color: ColorManager.kWhiteColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      total,
                      style: GoogleFonts.poppins(
                        fontSize: 15.h,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.kWhiteColor,
                      ),
                    ),
                    Text(
                      "/",
                      style: GoogleFonts.poppins(
                        fontSize: 15.h,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.kWhiteColor,
                      ),
                    ),
                    Text(
                      count,
                      style: GoogleFonts.poppins(
                        fontSize: 15.h,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.kWhiteColor,
                      ),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
