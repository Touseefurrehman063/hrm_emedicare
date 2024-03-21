import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/components/attendancehistorycart.dart';
import 'package:hrm_emedicare/components/customattendancecard.dart';
import 'package:hrm_emedicare/data/controller/attendence_controller/attendancecontroller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

class Attendancehistory extends StatefulWidget {
  const Attendancehistory({super.key});

  @override
  State<Attendancehistory> createState() => _AttendancehistoryState();
}

class _AttendancehistoryState extends State<Attendancehistory> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Attendancecontroller>(builder: (cont) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.05,
          ),
          child: Column(
            children: [
              Padding(
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
                        Card(
                          elevation: 2,
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorManager.kWhiteColor,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: CupertinoColors.white,
                              ),
                              // color: ColorManager.kWhiteColor,
                              width: MediaQuery.of(context).size.width / 3.5,
                              child: CupertinoTextField(
                                readOnly: true,
                                controller: TextEditingController(
                                  text: cont.dateFormatalert
                                      .format(cont.dateTimealert),
                                ),
                                prefix: Padding(
                                  padding:
                                      EdgeInsets.only(left: Get.width * 0.02),
                                  child: const Icon(
                                    Icons.calendar_month,
                                    color: CupertinoColors.black,
                                  ),
                                ),
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  color: CupertinoColors.black,
                                ),
                                onTap: () {
                                  showCupertinoModalPopup(
                                    context: context,
                                    builder: (BuildContext context) => Center(
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        child: CupertinoDatePicker(
                                          backgroundColor: Colors.white,
                                          initialDateTime: cont.dateTimealert,
                                          onDateTimeChanged:
                                              (DateTime newTime) {
                                            cont.UpdatedateTimealert(newTime);
                                          },
                                          use24hFormat: true,
                                          mode: CupertinoDatePickerMode.date,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Get.height * 0.03,
                      ),
                      child:
                          Text("-", style: GoogleFonts.poppins(fontSize: 30)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * 0.04),
                          child: Text("to".tr),
                        ),
                        Card(
                          elevation: 2,
                          child: Container(
                            //  color: ColorManager.kWhiteColor,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorManager.kWhiteColor,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: CupertinoColors.white,
                            ),
                            width: MediaQuery.of(context).size.width / 3.5,
                            child: CupertinoTextField(
                              readOnly: true,
                              controller: TextEditingController(
                                text: cont.dateFormatalert
                                    .format(cont.dateTime2alert),
                              ),
                              prefix: Padding(
                                padding:
                                    EdgeInsets.only(left: Get.width * 0.02),
                                child: const Icon(
                                  Icons
                                      .calendar_month, // You can replace this with your desired icon
                                  color: CupertinoColors.black,
                                ),
                              ),
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                color: CupertinoColors.black,
                              ),
                              onTap: () {
                                showCupertinoModalPopup(
                                  context: context,
                                  builder: (BuildContext context) => Center(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      child: CupertinoDatePicker(
                                        backgroundColor: Colors.white,
                                        initialDateTime: cont.dateTime2alert,
                                        onDateTimeChanged: (DateTime newTime) {
                                          cont.UpdatedateTimealert2(newTime);
                                        },
                                        use24hFormat: true,
                                        mode: CupertinoDatePickerMode.date,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Attendancecontroller.i.gettodayattendence();
                      },
                      child: Padding(
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
                      ),
                    )
                  ],
                ),
              ),
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
              GetBuilder<Attendancecontroller>(
                builder: (context) {
                  return Column(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: Attendancecontroller
                                .i.todayattendence?.data?.length ??
                            0,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          final dataList =
                              Attendancecontroller.i.todayattendence?.data;

                          if (dataList != null && dataList.isNotEmpty) {
                            final reversedDataList = dataList.reversed.toList();

                            if (index >= 0 && index < reversedDataList.length) {
                              final data = reversedDataList[index];
                              String statusText = "";
                              Color trailcolor = ColorManager.KgreenColor;

                              String status = data.status ?? "A";

                              if (status == "Present") {
                                statusText = 'P';
                                trailcolor = ColorManager.KgreenColor;
                              } else if (status == "Absent") {
                                statusText = 'A';
                                trailcolor = ColorManager.kDarkBlue;
                              } else if (status == "On Leave") {
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

                              return Attendancehistorycard(
                                trailingcolor: trailcolor,
                                text: statusText,
                                data: data,
                                status: status,
                              );
                            }
                          } else {
                            return Center(
                              child: Text("No Data",
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      color: ColorManager.KgreenColor)),
                            );
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
