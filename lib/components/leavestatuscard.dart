import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/data/controller/leave_controller/leave_controller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class LeaveStatusCard extends StatelessWidget {
  Color trailingcolor;
  String text;
  int i = 0;
  LeaveStatusCard(
      {super.key,
      required this.trailingcolor,
      required this.text,
      required this.i});

  String formattedDate(String? date) {
    if (date != null) {
      final parsedDate = DateTime.tryParse(date);
      if (parsedDate != null) {
        return DateFormat.yMMMd().format(parsedDate);
      }
    }
    return "-";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 06),
      child: GetBuilder<LeaveController>(builder: (cont) {
        String leaveType =
            cont.leavestatus?.table?[i].leaveType ?? ""; // Get the leave type

        Color containerColor;

        // Set the color based on the leave type
        switch (leaveType.toLowerCase()) {
          case 'sick leave':
            containerColor = const Color(0xffFF455E);
            break;
          case 'annual leave':
            containerColor = const Color(0xff23B480);
            break;
          case 'casual':
            containerColor = const Color(0xff663CDE);
            break;
          case 'other':
            containerColor = const Color(0xffF2B42A);
            break;
          default:
            containerColor = ColorManager.kmehrooncolor;
            break;
        }

        return Container(
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: GetBuilder<LeaveController>(builder: (context) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.025),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorManager.kWhiteColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.02,
                            vertical: Get.height * 0.02),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "date".tr,
                                  style: GoogleFonts.poppins(
                                      color: ColorManager.kblackColor,
                                      fontSize: 14.h,
                                      fontWeight: FontWeight.bold),
                                ),
                                // SizedBox(
                                //   height: 05.h,
                                // ),
                                Text(
                                  formattedDate(
                                      cont.leavestatus?.table?[i].applyDate),
                                  style: GoogleFonts.poppins(
                                    color: ColorManager.kblackColor,
                                    fontSize: 14.h,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "forwardedtoo".tr,
                                  style: GoogleFonts.poppins(
                                      color: ColorManager.kblackColor,
                                      fontSize: 14.h,
                                      fontWeight: FontWeight.bold),
                                ),
                                // SizedBox(
                                //   height: 05.h,
                                // ),
                                SizedBox(
                                  width: Get.width * 0.26,
                                  child: Text(
                                    cont.leavestatus?.table?[i]
                                            .lineManagerName ??
                                        "-",
                                    style: GoogleFonts.poppins(
                                      color: ColorManager.kblackColor,
                                      fontSize: 14.h,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Get.height * 0.01,
                                      vertical: Get.width * 0.01),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: trailingcolor,
                                  ),
                                  child: Center(
                                      child: Text(
                                    text,
                                    style: GoogleFonts.poppins(
                                      color: ColorManager.kWhiteColor,
                                      fontSize: 15.h,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                )
                              ],
                            ),
                            const Divider(
                              color: ColorManager.kGreyColor,
                              thickness: 1,
                              indent: 5,
                              endIndent: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "leavetype".tr,
                                  style: GoogleFonts.poppins(
                                      color: ColorManager.kblackColor,
                                      fontSize: 14.h,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 01.w,
                                ),
                                Text(
                                  cont.leavestatus?.table?[i].leaveType ?? "",
                                  style: GoogleFonts.poppins(
                                    color: ColorManager.kblackColor,
                                    fontSize: 14.h,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Column(
                              children: [
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "fromdate".tr,
                                            style: GoogleFonts.poppins(
                                              color: ColorManager.kGreyColor,
                                              fontSize: 15.h,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 05.h,
                                          ),
                                          Text(
                                            formattedDate(cont.leavestatus
                                                ?.table?[i].leaveFrom),
                                            style: GoogleFonts.poppins(
                                              color: ColorManager.kblackColor,
                                              fontSize: 15.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const VerticalDivider(
                                        width: 20,
                                        thickness: 1,
                                        indent: 5,
                                        endIndent: 03,
                                        color: ColorManager.kGreyColor,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "todate".tr,
                                            style: GoogleFonts.poppins(
                                              color: ColorManager.kGreyColor,
                                              fontSize: 15.h,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 05.h,
                                          ),
                                          Text(
                                            formattedDate(cont.leavestatus
                                                ?.table?[i].leaveTo),
                                            style: GoogleFonts.poppins(
                                              color: ColorManager.kblackColor,
                                              fontSize: 15.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const VerticalDivider(
                                        width: 20,
                                        thickness: 1,
                                        indent: 5,
                                        endIndent: 03,
                                        color: ColorManager.kGreyColor,
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: Get.width * 0.2,
                                            child: Text(
                                              "totaldays".tr,
                                              maxLines: 1,
                                              style: GoogleFonts.poppins(
                                                color: ColorManager.kGreyColor,
                                                fontSize: 15.h,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 05.h,
                                          ),
                                          Text(
                                            " ${cont.leavestatus?.table?[i].numberOfDays?.toString().split(".")[0]} Days",
                                            style: GoogleFonts.poppins(
                                              color: ColorManager.kblackColor,
                                              fontSize: 15.h,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: ColorManager.kGreyColor,
                                  thickness: 1,
                                  indent: 5,
                                  endIndent: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "titlee".tr,
                                      style: GoogleFonts.poppins(
                                          color: ColorManager.kblackColor,
                                          fontSize: 14.h,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 01.w,
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.6,
                                      child: Text(
                                        cont.leavestatus?.table?[i].title ??
                                            "-",
                                        style: GoogleFonts.poppins(
                                          color: ColorManager.kblackColor,
                                          fontSize: 14.h,
                                        ),
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "descript".tr,
                                      style: GoogleFonts.poppins(
                                          color: ColorManager.kblackColor,
                                          fontSize: 14.h,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 01.w,
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.5,
                                      child: Text(
                                        cont.leavestatus?.table?[i]
                                                .description ??
                                            "-",
                                        style: GoogleFonts.poppins(
                                          color: ColorManager.kblackColor,
                                          fontSize: 14.h,
                                        ),
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
        );
      }),
    );
  }
}
