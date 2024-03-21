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
import 'package:shimmer/shimmer.dart';

String formatDateString(String dateString) {
  try {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('MMM dd, yyyy').format(dateTime);
    return formattedDate;
  } catch (e) {
    print("Error formatting date: $e");
    return "";
  }
}

// ignore: must_be_immutable
class Attendancehistorycard extends StatefulWidget {
  Color trailingcolor;
  String text;
  String status;
  Data? data;
  Attendancehistorycard(
      {super.key,
      required this.trailingcolor,
      required this.text,
      this.data,
      required this.status});

  @override
  State<Attendancehistorycard> createState() => _AttendancehistorycardState();
}

class _AttendancehistorycardState extends State<Attendancehistorycard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  String circleStatus = "";
  double progressPercent = 0;
  double progressPercentStart = 0;
  Color trailcolor = ColorManager.kgreencolorstatus;
  Color color = ColorManager.KgreenColor;
  void setData() async {
    String status = widget.status;

    if (status == "Present") {
      trailcolor = const Color.fromARGB(255, 180, 222, 197);
    } else if (status == "Absent") {
      trailcolor = const Color.fromARGB(255, 152, 176, 239);
    } else if (status == "On Leave") {
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

    if (status == "Present") {
      circleStatus = "Completed";
    } else if (status == "Absent") {
      circleStatus = "Not Present";
    } else if (status == "On Leave") {
      circleStatus = "Leave";
    } else if (status == "Day off") {
      circleStatus = "Day off";
    } else if (status == "Late") {
      circleStatus = "Belated";
    } else if (status == "Saturday") {
      circleStatus = "Day off";
    } else if (status == "Sunday") {
      circleStatus = "Day off";
    } else if (status == "") {
      circleStatus = "";
    }

    if (status == "Present") {
      progressPercent = 1;
      progressPercentStart = 0;
    } else if (status == "Absent") {
      progressPercent = 0;
      progressPercentStart = 0;
    } else if (status == "On Leave") {
      progressPercent = 0;
      progressPercentStart = 0;
    } else if (status == "Day off") {
      progressPercent = 0;
      progressPercentStart = 0;
    } else if (status == "Late") {
      //    start 0.2 and end 1
      progressPercentStart = 0.2;
      progressPercent = 0.8;
    } else if (status == "Saturday") {
      progressPercent = 0;
      progressPercentStart = 0;
    } else if (status == "Sunday") {
      progressPercent = 0;
      progressPercentStart = 0;
    } else if (status == "") {
      progressPercent = 0;
      progressPercentStart = 0;
    }

    if (status == "Present") {
      color = ColorManager.kgreencolorstatus;
    } else if (status == "Absent") {
      color = ColorManager.kDarkBlue;
    } else if (status == "On Leave") {
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

  @override
  Widget build(BuildContext context) {
    print(widget.status);
    print(circleStatus);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
      child: Container(
        decoration: BoxDecoration(
          color: trailcolor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: GetBuilder<Attendancecontroller>(builder: (cont) {
          return cont.isattendanceLoading == true
              ? Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade500,
                  enabled: Attendancecontroller.i.isattendanceLoading,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                    child: Column(
                      children: [
                        Attendancecontroller.i.index == 0
                            ? Row(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          child: AuthController.i.userProfile
                                                      ?.picturePath !=
                                                  null
                                              ? Image.network(
                                                  baseURL +
                                                      AuthController
                                                          .i
                                                          .userProfile
                                                          ?.picturePath,
                                                  height: Get.height * 0.1,
                                                  width: Get.width * 0.2,
                                                  fit: BoxFit.cover,
                                                )
                                              : Image.asset(
                                                  Images.temppicture,
                                                  height: Get.height * 0.09,
                                                )),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.45,
                                        child: Text(
                                          AuthController
                                                  .i.userProfile?.userName ??
                                              "",
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
                                        AuthController
                                                .i.userProfile?.department ??
                                            "",
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
                                      color: widget.trailingcolor,
                                    ),
                                    child: Center(
                                        child: Text(
                                      widget.text,
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
                            vertical: Get.height * 0.013,
                            horizontal: Get.width * 0.01,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorManager.kWhiteColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Get.height * 0.01,
                                horizontal: Get.width * 0.01,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                            formatDateString(
                                                widget.data?.date ?? ""),
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
                                            widget.data?.timeIn ?? "",
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
                                            "${widget.data?.timeOut}",
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
                                    indent: 10,
                                    endIndent: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularPercentIndicator(
                                        radius: 35.0,
                                        lineWidth: 8.0,
                                        percent: progressPercent,
                                        startAngle: progressPercentStart,
                                        reverse: true,
                                        center: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Get.width * 0.001),
                                          child: Text(
                                            circleStatus,
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 10),
                                          ),
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
                                                .formatDuration(
                                                    widget.data?.timeDiff),
                                          ),
                                          Text(
                                            "of 9 hrs",
                                            style: GoogleFonts.poppins(),
                                          ),
                                        ],
                                      ),
                                      Attendancecontroller.i.index == 1
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 30.w,
                                                ),
                                                Container(
                                                  height: Get.height * 0.05,
                                                  width: Get.width * 0.09,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: widget.trailingcolor,
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    widget.text,
                                                    style: GoogleFonts.poppins(
                                                      color: ColorManager
                                                          .kWhiteColor,
                                                      fontSize: 22.h,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                SizedBox(
                                                    width: Get.width * 0.19,
                                                    child: Text(
                                                      "${widget.data?.status}",
                                                      style:
                                                          GoogleFonts.poppins(),
                                                    ))
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
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                  child: Column(
                    children: [
                      Attendancecontroller.i.index == 0
                          ? Row(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: AuthController.i.userProfile
                                                    ?.picturePath !=
                                                null
                                            ? Image.network(
                                                baseURL +
                                                    AuthController.i.userProfile
                                                        ?.picturePath,
                                                height: Get.height * 0.1,
                                                width: Get.width * 0.2,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.asset(
                                                Images.temppicture,
                                                height: Get.height * 0.09,
                                              )),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Get.width * 0.45,
                                      child: Text(
                                        AuthController
                                                .i.userProfile?.userName ??
                                            "",
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
                                      AuthController
                                              .i.userProfile?.department ??
                                          "",
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
                                    color: widget.trailingcolor,
                                  ),
                                  child: Center(
                                      child: Text(
                                    widget.text,
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
                          vertical: Get.height * 0.013,
                          horizontal: Get.width * 0.01,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: ColorManager.kWhiteColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Get.height * 0.01,
                              horizontal: Get.width * 0.01,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                          formatDateString(
                                              widget.data?.date ?? ""),
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
                                          widget.data?.timeIn ?? "",
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
                                          "${widget.data?.timeOut}",
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
                                  indent: 10,
                                  endIndent: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularPercentIndicator(
                                      radius: 35.0,
                                      lineWidth: 8.0,
                                      percent: progressPercent,
                                      startAngle: progressPercentStart,
                                      reverse: true,
                                      center: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Get.width * 0.001),
                                        child: Text(
                                          circleStatus,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                      ),
                                      progressColor: color,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          Attendancecontroller.i.formatDuration(
                                              widget.data?.timeDiff),
                                        ),
                                        Text(
                                          "of 9 hrs",
                                          style: GoogleFonts.poppins(),
                                        ),
                                      ],
                                    ),
                                    Attendancecontroller.i.index == 1
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 30.w,
                                              ),
                                              Container(
                                                height: Get.height * 0.05,
                                                width: Get.width * 0.09,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: widget.trailingcolor,
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  widget.text,
                                                  style: GoogleFonts.poppins(
                                                    color: ColorManager
                                                        .kWhiteColor,
                                                    fontSize: 22.h,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              SizedBox(
                                                  width: Get.width * 0.19,
                                                  child: Text(
                                                    "${widget.data?.status}",
                                                    style:
                                                        GoogleFonts.poppins(),
                                                  ))
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
