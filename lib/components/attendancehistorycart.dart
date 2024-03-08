import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/data/controller/attendence_controller/attendancecontroller.dart';
import 'package:hrm_emedicare/data/controller/auth_controller/auth_controller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:hrm_emedicare/models/today_attendence_model/today_attendence_model.dart';
import 'package:hrm_emedicare/utils/constants/constants.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

String formatDateString(String dateString) {
  try {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('MMM dd, yyyy').format(dateTime);
    return formattedDate;
  } catch (e) {
    print("Error formatting date: $e");
    return ""; // Return an empty string or handle the error as needed
  }
}

// ignore: must_be_immutable
class Attendancehistorycard extends StatelessWidget {
  Color trailingcolor;
  String text;
  Data? data;
  Attendancehistorycard(
      {super.key, required this.trailingcolor, required this.text, this.data});

  @override
  Widget build(BuildContext context) {
    // Attendancecontroller.i.gettodayattendence();

    Color trailcolor = ColorManager.kgreencolorstatus;

    if (data != null) {
      String status = data?.status ?? "A";

      if (status == "Present") {
        trailcolor = const Color.fromARGB(255, 180, 222, 197);
      } else if (status == "Absent") {
        trailcolor = const Color.fromARGB(255, 152, 176, 239);
      } else if (status == "Leave") {
        trailcolor = const Color.fromARGB(255, 230, 213, 175);
      } else if (status == "Day off") {
        trailcolor = const Color.fromARGB(255, 234, 181, 188);
      } else if (status == "Late") {
        trailcolor = const Color.fromARGB(255, 161, 139, 221);
      } else if (status == "Saturday") {
        trailcolor = const Color.fromARGB(255, 234, 181, 188);
      } else if (status == "Sunday") {
        trailcolor = const Color.fromARGB(255, 234, 181, 188);
      } else if (status == "") {
        trailcolor = const Color.fromARGB(255, 234, 181, 188);
      }
    }
    Color color = ColorManager.KgreenColor;

    if (data != null) {
      String status = data?.status ?? "A";

      if (status == "Present") {
        color = ColorManager.kgreencolorstatus;
      } else if (status == "Absent") {
        color = ColorManager.kDarkBlue;
      } else if (status == "Leave") {
        color = ColorManager.kYellowColor;
      } else if (status == "Day off") {
        color = ColorManager.kMaroonColor;
      } else if (status == "Late") {
        color = ColorManager.kmehrooncolor;
      } else if (status == "Saturday" || status == "Sunday") {
        color = ColorManager.kMaroonColor;
      } else if (status == "") {
        color = ColorManager.kMaroonColor;
      }
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 05),
      child: Container(
        decoration: BoxDecoration(
          color: trailcolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: GetBuilder<Attendancecontroller>(builder: (cont) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
            child: Column(
              children: [
                Attendancecontroller.i.index == 0
                    ? Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              // borderRadius: BorderRadius.circular(30),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: AuthController
                                              .i.userProfile?.picturePath !=
                                          null
                                      ? Image.network(
                                          baseURL +
                                              AuthController
                                                  .i.userProfile?.picturePath,
                                          height: Get.height * 0.1,
                                          width: Get.width * 0.2,
                                          fit: BoxFit.fill,
                                        )
                                      : Image.asset(
                                          Images.temppicture,
                                          height: Get.height * 0.09,
                                        )),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width * 0.45,
                                child: Text(
                                  AuthController.i.userProfile?.userName ?? "",
                                  style: GoogleFonts.poppins(
                                    color: ColorManager.kblackColor,
                                    fontSize: 16.h,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 06.h,
                              ),
                              Text(
                                AuthController.i.userProfile?.department ?? "",
                                style: GoogleFonts.poppins(
                                  color: ColorManager.kblackColor,
                                  fontSize: 14.h,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: Get.height * 0.05,
                            width: Get.width * 0.09,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: trailingcolor,
                            ),
                            child: Center(
                                child: Text(
                              text,
                              style: GoogleFonts.poppins(
                                color: ColorManager.kWhiteColor,
                                fontSize: 22.h,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          )
                        ],
                      )
                    : const SizedBox.shrink(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: Get.height * 0.02,
                      horizontal: Get.width * 0.01),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorManager.kWhiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "datenosemicolon".tr,
                                  style: GoogleFonts.poppins(
                                    color: ColorManager.kGreyColor,
                                    fontSize: 15.h,
                                  ),
                                ),
                                SizedBox(
                                  height: 05.h,
                                ),
                                Text(
                                  // DateFormat('dd MM, yyyy')
                                  //     .format(DateTime.parse(data?.date ?? "")),

                                  formatDateString(data?.date ?? ""),
                                  style: GoogleFonts.poppins(
                                    color: ColorManager.kblackColor,
                                    fontSize: 15.h,
                                  ),
                                ),
                              ],
                            ),
                            const VerticalDivider(
                              indent: 20,
                              endIndent: 20,
                              color: ColorManager.kGreyColor,
                              width: 3,
                            ),
                            Column(
                              children: [
                                Text(
                                  "intime".tr,
                                  style: GoogleFonts.poppins(
                                    color: ColorManager.kGreyColor,
                                    fontSize: 15.h,
                                  ),
                                ),
                                SizedBox(
                                  height: 05.h,
                                ),
                                Text(
                                  //   DateFormat('hh:mm a').format(
                                  //       DateTime.parse(data?.timeIn ?? "")),
                                  data?.timeIn ?? "",
                                  style: GoogleFonts.poppins(
                                    color: ColorManager.kblackColor,
                                    fontSize: 15.h,
                                  ),
                                ),
                              ],
                            ),
                            const VerticalDivider(
                              indent: 20,
                              endIndent: 20,
                              color: ColorManager.kGreyColor,
                              width: 3,
                            ),
                            Column(
                              children: [
                                Text(
                                  "outtime".tr,
                                  style: GoogleFonts.poppins(
                                    color: ColorManager.kGreyColor,
                                    fontSize: 15.h,
                                  ),
                                ),
                                SizedBox(
                                  height: 05.h,
                                ),
                                Text(
                                  "${data?.timeOut}",
                                  style: GoogleFonts.poppins(
                                    color: ColorManager.kblackColor,
                                    fontSize: 15.h,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          color: ColorManager.kGreyColor,
                          thickness: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 35.0,
                              lineWidth: 8.0,
                              percent: 0.5,
                              center: Text(
                                "inprogress".tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                              progressColor: color,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              children: [
                                Text(
                                  Attendancecontroller.i
                                      .formatDuration(data?.hoursWorked),
                                ),
                                const Text("of 8 hrs"),
                              ],
                            ),
                            Attendancecontroller.i.index == 1
                                ? Row(
                                    children: [
                                      SizedBox(
                                        width: 30.w,
                                      ),
                                      // const Spacer(),
                                      Container(
                                        height: Get.height * 0.05,
                                        width: Get.width * 0.09,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: trailingcolor,
                                        ),
                                        child: Center(
                                            child: Text(
                                          text,
                                          style: GoogleFonts.poppins(
                                            color: ColorManager.kWhiteColor,
                                            fontSize: 22.h,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text("${data?.status}")
                                    ],
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
