import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

// ignore: must_be_immutable
class Customcontainer extends StatelessWidget {
  String img;
  List<Color> colors;
  String name;

  Customcontainer(
      {super.key, required this.img, required this.colors, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.075,
      width: Get.width * 0.29,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            colors: colors,
            end: Alignment.centerLeft,
            begin: Alignment.centerRight),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Image.asset(
          img,
          height: Get.height * 0.04,
        ),
        Text(
          name,
          style: GoogleFonts.poppins(
              color: ColorManager.kWhiteColor, fontSize: 12),
        ),
      ]),
    );
  }
}
