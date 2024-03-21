import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/View/leave_screens/leave.dart';
import 'package:hrm_emedicare/View/nodatafound/no_data_found.dart';
import 'package:hrm_emedicare/View/noticeboard/notice_board.dart';
import 'package:hrm_emedicare/View/pay_slip/pay_slip.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/components/customdashbordcard.dart';
import 'package:hrm_emedicare/components/customnavbar.dart';
import 'package:hrm_emedicare/components/dashboard_painter_progress.dart';
import 'package:hrm_emedicare/components/dashboard_progress_dot.dart';
import 'package:hrm_emedicare/components/dashboardcustomcard.dart';
import 'package:hrm_emedicare/data/controller/auth_controller/auth_controller.dart';
import 'package:hrm_emedicare/data/controller/get_current_location_controller.dart';
import 'package:hrm_emedicare/data/repositories/attendence_repository/attendence_repsoitory.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:hrm_emedicare/utils/constants/constants.dart';
import 'package:intl/intl.dart';
import 'dart:core';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:shimmer/shimmer.dart';

String getTimeDifference() {
  DateTime currentTimePakistan =
      DateTime.now().toUtc().add(const Duration(hours: 5));
  const int officeStartHour = 9;
  const int officeEndHour = 18;
  const int officeEndMinute = 0;

  final int currentHour = currentTimePakistan.hour;
  final int currentMinute = currentTimePakistan.minute;

  if (currentHour >= officeStartHour &&
      (currentHour < officeEndHour ||
          (currentHour == officeEndHour && currentMinute <= officeEndMinute))) {
    // During office hours (from 9am to 12:05pm)
    final int elapsedHours = currentHour - officeStartHour;
    final int elapsedMinutes = currentMinute;
    return '${elapsedHours}h ${elapsedMinutes}min';
  } else if ((currentHour == officeEndHour &&
          currentMinute > officeEndMinute) ||
      (currentHour > officeEndHour && currentHour < 24)) {
    // After office hours until midnight (from 12:06pm to 12:00am)
    return '9h 0min';
  } else {
    // From midnight until office hours start (from 12:01am to 9am)
    return '0h 0min';
  }
}

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  Dashboard({super.key});
  double actualWidthDP = ScreenUtil().setWidth(360);
  double actualHeightDP = ScreenUtil().setHeight(800);

  @override
  Widget build(BuildContext context) {
    AuthController.i.getuserprofile();
    DateTime now = DateTime.now()
        .toUtc()
        .add(const Duration(hours: 5)); // Convert to Pakistan time
    double progressValue = now.hour / 24; // Assuming 24-hour day
    String centerText = DateTime.now().weekday == DateTime.friday
        ? '01:15PM - 2:45PM'
        : '01:15PM - 2:30PM';

    // WORKING TIME
    String timeDifference = getTimeDifference();

    return Material(
      child: Scaffold(
        bottomNavigationBar: Customnavbar(
          index: 0,
        ),
        body: Stack(
          children: [
            Container(
              height: actualHeightDP * 0.25,
              width: actualWidthDP * 1,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffF58020),
                    Color(0xffF6EE31),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    leading: InkWell(
                      onTap: () {
                        if (ZoomDrawer.of(context)?.isOpen() ?? false) {
                          ZoomDrawer.of(context)?.close();
                        } else {
                          ZoomDrawer.of(context)?.open();
                        }
                      },
                      child: Image.asset(
                        Images.menu,
                        height: actualHeightDP * 0.03,
                      ),
                    ),
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Container(
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child:
                                    AuthController.i.userProfile?.picturePath !=
                                            null
                                        ? Image.network(
                                            baseURL +
                                                AuthController
                                                    .i.userProfile?.picturePath,
                                            height: Get.height * 0.07,
                                            width: Get.width * 0.15,
                                            fit: BoxFit.cover,
                                          )
                                        : Image.asset(
                                            Images.temppicture,
                                            height: Get.height * 0.07,
                                          )),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getGreetingMessage(),
                                style: const TextStyle(
                                    color: ColorManager.kWhiteColor,
                                    fontSize: 12),
                              ),
                              GetBuilder<AuthController>(builder: (cnt) {
                                return SizedBox(
                                  width: Get.width * 0.4,
                                  child: Text(
                                    cnt.userProfile?.userName ?? " ",
                                    style: GoogleFonts.poppins(
                                        color: ColorManager.kWhiteColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }),
                            ],
                          )
                        ],
                      ),
                    ),
                    trailing: InkWell(
                      child: Image.asset(
                        Images.notify,
                        height: actualHeightDP * 0.038,
                      ),
                      onTap: () {
                        Get.to(NoDataFound());
                      },
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: actualHeightDP * 0.73,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: actualWidthDP * 0.04),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(Leave());
                              },
                              child: Customcontainer(
                                img: Images.handwriting,
                                name: "applyleave".tr,
                                colors: const [
                                  Color(0xff44A848),
                                  Color(0xff006104),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(PaySlip());
                              },
                              child: Customcontainer(
                                img: Images.coins,
                                name: "payslip".tr,
                                colors: const [
                                  Color(0xffFFC700),
                                  Color(0xffF38020),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => NoticeBoard());
                              },
                              child: Customcontainer(
                                img: Images.notificationringer,
                                name: "noticeboard".tr,
                                colors: const [
                                  Color(0xffFF0000),
                                  Color(0xffAE0000),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.04),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "calender".tr,
                                style: GoogleFonts.poppins(
                                  fontSize: 16.h,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat('MMMM d, y').format(DateTime.now()),
                                style: GoogleFonts.poppins(
                                  fontSize: 12.h,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CalendarWeek(
                          controller: CalendarWeekController(),
                          height: Get.height * 0.13,
                          todayBackgroundColor: ColorManager.kOrangeColor,
                          todayDateStyle: GoogleFonts.poppins(
                              color: ColorManager.kWhiteColor),
                          weekendsStyle: GoogleFonts.poppins(
                              color: ColorManager.kblackColor),
                          dayOfWeekStyle: GoogleFonts.poppins(
                              color: ColorManager.kblackColor),
                          dateStyle: GoogleFonts.poppins(
                              color: ColorManager.kblackColor),
                          weekendsIndexes: const [6],
                          minDate: DateTime.now().add(
                            const Duration(days: -365),
                          ),
                          maxDate: DateTime.now().add(
                            const Duration(days: 365),
                          ),
                          onDatePressed: (DateTime datetime) {
                            // Do something
                          },
                          onWeekChanged: () {
                            // Do something
                          },
                          monthViewBuilder: (DateTime time) => Align(
                            alignment: FractionalOffset.bottomLeft,
                            child: Text(
                              DateFormat.yMMMM().format(time),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 12.h,
                                  color: ColorManager.kWhiteColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          dayOfWeek: const [
                            "M",
                            "T",
                            "W",
                            "T",
                            "F",
                            "S",
                            "S",
                          ],
                          decorations: [
                            DecorationItem(
                              decorationAlignment: FractionalOffset.bottomRight,
                              date: DateTime.now(),
                            ),
                          ],
                        ),
                        SizedBox(
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.h, vertical: 10.h),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: Text(
                                      "todayworkinghour".tr,
                                      style: GoogleFonts.poppins(
                                          fontSize: 14.h,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "workinghour".tr,
                                      ),
                                      const Spacer(),
                                      const Icon(Icons.timer),
                                      Text(timeDifference,
                                          style: GoogleFonts.poppins(
                                              fontSize: 14.h,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Image.asset(
                                    Images.hotcoffee,
                                    height: 30.h,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.7,
                                        child: CustomPaint(
                                          painter:
                                              ProgressPainter(progressValue),
                                          child: Container(
                                            height:
                                                13, // Decreased height of the progress line
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: Get.height *
                                              0.01), // Adjusted spacing
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Dot(
                                            icon: Icons.access_time,
                                            label: '09:00AM',
                                            position: 0,
                                          ),
                                          Text(
                                            centerText,
                                            style: GoogleFonts.poppins(
                                                fontSize: 11),
                                          ),
                                          const Dot(
                                            icon: Icons.access_time,
                                            label: '06:00PM',
                                            position: 1,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Status: ${"Checked In"}",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * 0.02,
                                      ),
                                      GetBuilder<LocationController>(
                                          builder: (cont) {
                                        return ElevatedButton(
                                          onPressed: () async {
                                            try {
                                              LocationController.i
                                                  .updateisInLoading(true);
                                              AttendanceRepo ar =
                                                  AttendanceRepo();
                                              Position position =
                                                  await LocationController.i
                                                      .determinePosition();
                                              String latitude =
                                                  position.latitude.toString();
                                              String longitude =
                                                  position.longitude.toString();
                                              String address =
                                                  await LocationController.i
                                                      .getAddressFromLatLong(
                                                          position);

                                              await ar.submitAttendance("0",
                                                  latitude, longitude, address);
                                              LocationController.i
                                                  .updateisInLoading(false);
                                            } catch (e) {
                                              LocationController.i
                                                  .updateisInLoading(false);
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ColorManager.kgreencolorstatus,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: cont.isInLoading
                                              ? Shimmer.fromColors(
                                                  baseColor:
                                                      Colors.grey.shade300,
                                                  highlightColor:
                                                      Colors.grey.shade500,
                                                  enabled: LocationController
                                                      .i.isInLoading,
                                                  child: Text(
                                                    '  CHECK-IN  ',
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              : Text(
                                                  '  CHECK-IN  ',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                        );
                                      }),
                                      SizedBox(
                                        width: Get.width * 0.01,
                                      ),
                                      GetBuilder<LocationController>(
                                          builder: (cont) {
                                        return ElevatedButton(
                                          onPressed: () async {
                                            try {
                                              LocationController.i
                                                  .updateisOutLoading(true);
                                              AttendanceRepo ar =
                                                  AttendanceRepo();
                                              Position position =
                                                  await LocationController.i
                                                      .determinePosition();
                                              String latitude =
                                                  position.latitude.toString();
                                              String longitude =
                                                  position.longitude.toString();
                                              String address =
                                                  await LocationController.i
                                                      .getAddressFromLatLong(
                                                          position);

                                              await ar.submitAttendance("1",
                                                  latitude, longitude, address);
                                              LocationController.i
                                                  .updateisOutLoading(false);
                                            } catch (e) {
                                              LocationController.i
                                                  .updateisOutLoading(false);
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ColorManager.kOrangeColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: cont.isOutLoading
                                              ? Shimmer.fromColors(
                                                  baseColor:
                                                      Colors.grey.shade300,
                                                  highlightColor:
                                                      Colors.grey.shade500,
                                                  child: Text(
                                                    'CHECK-OUT',
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                )
                                              : Text(
                                                  'CHECK-OUT',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                        );
                                      }),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          // height: Get.height * 0.01,
                          width: actualWidthDP * 0.02,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.03,
                              vertical: Get.height * 0.015),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Attendance',
                                style: GoogleFonts.poppins(
                                    color: ColorManager.kOrangeColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DateFormat('MMMM d, y').format(DateTime.now()),
                                style: GoogleFonts.poppins(
                                    fontSize: 12, color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Customdashboardcard(
                                count: "16",
                                title: "present".tr,
                                foregroundcolor: const Color(0xffDEF1EA),
                                shadowcolor: const Color(0xff44A848),
                              ),
                            ),
                            Expanded(
                              child: Customdashboardcard(
                                count: "1",
                                title: "absent".tr,
                                foregroundcolor: const Color(0xffF8E5ED),
                                shadowcolor: const Color(0xffFF455E),
                              ),
                            ),
                            Expanded(
                              child: Customdashboardcard(
                                count: "5",
                                title: "holiday".tr,
                                shadowcolor: const Color(0xffF38020),
                                foregroundcolor: const Color(0xffF6EEE5),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: actualHeightDP * 0.02,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Customdashboardcard(
                                count: "2",
                                title: "halfleave".tr,
                                foregroundcolor: const Color(0xffF3F1FD),
                                shadowcolor: const Color(0xff663CDE),
                              ),
                            ),
                            Expanded(
                              child: Customdashboardcard(
                                count: "2",
                                title: 'ofleave'.tr,
                                foregroundcolor: const Color(0xffE0EDF1),
                                shadowcolor: const Color(0xff00E0FF),
                              ),
                            ),
                            Expanded(
                              child: Customdashboardcard(
                                count: "4",
                                title: "leave".tr,
                                foregroundcolor: const Color(0xffF4ECCE),
                                shadowcolor: const Color(0xffFFC800),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * 0.02)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String getGreetingMessage() {
  var now = DateTime.now();
  var hour = now.hour;

  if (hour < 12) {
    return "goodmorning".tr;
  } else if (hour < 15) {
    return "goodAfterNoon".tr;
  } else if (hour < 19) {
    return "goodEvening".tr;
  } else if (hour < 4) {
    return "goodNight".tr;
  } else {
    return "goodmorning".tr;
  }
}
