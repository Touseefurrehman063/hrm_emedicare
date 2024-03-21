import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_emedicare/components/attendancehistorycart.dart';
import 'package:hrm_emedicare/components/customattendancecard.dart';
import 'package:hrm_emedicare/data/controller/attendence_controller/attendancecontroller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

class Todayattandence extends StatefulWidget {
  const Todayattandence({super.key});

  @override
  State<Todayattandence> createState() => _TodayattandenceState();
}

class _TodayattandenceState extends State<Todayattandence> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    Future.delayed(Duration.zero).then((value) {
      Attendancecontroller.i.UpdatedateTimealert2(DateTime.now());
      Attendancecontroller.i.UpdatedateTimealert(
          DateTime.now().subtract(const Duration(days: 30)));
      Attendancecontroller.i.gettodayattendence();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05,
        ),
        child: Column(
          children: [
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
                      itemCount: 1,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        final data =
                            Attendancecontroller.i.todayattendence?.data?.last;

                        String statusText = "";
                        Color trailcolor = ColorManager.KgreenColor;
                        String status = data?.status ?? "Present";
                        if (data != null) {
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
                            status: status,
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
