import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/View/attendance/todayattendance.dart';
import 'package:hrm_emedicare/components/customnavbar.dart';
import 'package:hrm_emedicare/data/controller/attendence_controller/attendancecontroller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:hrm_emedicare/helper/routerclass/myrouter.dart';

// ignore: must_be_immutable
class Attendancescreen extends StatelessWidget {
  Attendancescreen({super.key});
// late final CustomSegmentedController<int> controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = CustomSegmentedController();
//     controller.addListener(() {
//       print('listener ${controller.value}');
//     });
//   }

  @override
  Widget build(BuildContext context) {
    final cnt = Get.put(Attendancecontroller());
    Attendancecontroller.i.gettodayattendence();
    return Scaffold(
      bottomNavigationBar: Customnavbar(
        index: 2,
      ),
      backgroundColor: ColorManager.kWhiteColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.offAndToNamed(
              Myrouting.home,
            );
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: ColorManager.kblackColor,
          ),
        ),
        title: Text(
          "attendence".tr,
          style: GoogleFonts.poppins(
              fontSize: 20.h,
              color: ColorManager.kOrangeColor,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorManager.kWhiteColor,
      ),
      body: GetBuilder<Attendancecontroller>(builder: (context) {
        return Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Center(
                child: CustomSlidingSegmentedControl<int>(
              fromMax: true,
              fixedWidth: Get.width * 0.48,
              height: Get.height * 0.06,
              innerPadding: EdgeInsets.zero,
              children: {
                0: Text("today".tr),
                1: Text("history".tr),
              },
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              // padding: 10,
              thumbDecoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(1, 1),
                    color: ColorManager.kGreyColor,
                    spreadRadius: 1,
                    blurRadius: 1,
                  ),
                  BoxShadow(
                    offset: Offset(-1, -1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    color: ColorManager.kGreyColor,
                  )
                ],
                borderRadius:
                    cnt.index == 0 ? cnt.dynamicBorder : cnt.rightborder,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(0.7, 0.0),
                  colors: [
                    Color(0xffF38020),
                    Color(0xffF38020),
                    // Color(0xffe1306c),
                  ],
                ),
              ),
              onValueChanged: (int value) {
                cnt.updateindex(value);
              },
            )),
            SizedBox(
              height: 10.h,
            ),
            Expanded(child: pages[cnt.index]),
          ],
        );
      }),
    );
  }

  List<Widget> pages = [
    const Todayattandence(),
    const Todayattandence(),
  ];
}
