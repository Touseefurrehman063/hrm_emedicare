import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/components/attendancehistorycart.dart';
import 'package:hrm_emedicare/components/customattendancecard.dart';
import 'package:hrm_emedicare/data/controller/attendence_controller/attendancecontroller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

class Todayattandence extends StatelessWidget {
  const Todayattandence({super.key});

  @override
  Widget build(BuildContext context) {
    Attendancecontroller.i.gettodayattendence();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05,
        ),
        child: Column(
          children: [
            Attendancecontroller.i.index == 1
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.01),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: Get.width * 0.04),
                              child: Text("from".tr),
                            ),
                            const Card(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Icon(Icons.calendar_month),
                                    Text("20-07-2022")
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: Get.height * 0.03,
                          ),
                          child: Text("-",
                              style: GoogleFonts.poppins(fontSize: 30)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: Get.width * 0.04),
                              child: Text("to".tr),
                            ),
                            const Card(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Icon(Icons.calendar_month),
                                    Text("20-08-2022")
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: Get.height * 0.03, right: Get.width * 0.05),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: ColorManager.kgreencolorstatus,
                              shape: BoxShape.circle,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.search,
                                color: ColorManager.kWhiteColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Customattandencestatuscard(
                    color: const Color(0xff23B480),
                    title: 'present'.tr,
                    total: '22',
                    count: '07'),
                Customattandencestatuscard(
                    color: const Color(0xff663CDE),
                    title: 'Late'.tr,
                    total: '22',
                    count: '07'),
                Customattandencestatuscard(
                    color: const Color(0xffFF455E),
                    title: 'absent'.tr,
                    total: '22',
                    count: '07'),
                Customattandencestatuscard(
                    color: const Color(0xffF2B42A),
                    title: 'leave'.tr,
                    total: '22',
                    count: '07'),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            GetBuilder<Attendancecontroller>(builder: (context) {
              return Column(
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: Attendancecontroller.i.index == 0
                          ? 1
                          : Attendancecontroller
                              .i.todayattendence?.data?.length,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        final data = Attendancecontroller.i.index == 0
                            ? Attendancecontroller.i.todayattendence?.data?.last
                            : Attendancecontroller
                                .i.todayattendence?.data?[index];

                        String statusText = "";
                        Color trailcolor = ColorManager.KgreenColor;

                        if (data != null) {
                          String status = data.status ?? "A";

                          if (status == "Present") {
                            statusText = 'P';
                            trailcolor = ColorManager.KgreenColor;
                          } else if (status == "Absent") {
                            statusText = 'A';
                            trailcolor = ColorManager.kDarkBlue;
                          } else if (status == "Leave") {
                            statusText = 'L';
                            trailcolor = ColorManager.kYellowColor;
                          } else if (status == "Day off") {
                            statusText = 'D';
                            trailcolor = ColorManager.kMaroonColor;
                          } else if (status == "Late") {
                            statusText = 'L';
                            trailcolor = ColorManager.kmehrooncolor;
                          } else if (status == "Saturday" ||
                              status == "Sunday") {
                            statusText = 'D';
                            trailcolor = ColorManager.kMaroonColor;
                          } else if (status == "") {
                            statusText = 'D';
                            trailcolor = ColorManager.kMaroonColor;
                          }
                        }
                        return Attendancehistorycard(
                            trailingcolor: trailcolor,
                            text: statusText,
                            data: data);
                      }),
                  SizedBox(
                    height: Get.height * 0.02,
                  )
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
