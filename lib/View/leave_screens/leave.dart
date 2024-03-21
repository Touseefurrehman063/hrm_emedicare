import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/View/leave_screens/apply_leave.dart';
import 'package:hrm_emedicare/View/leave_screens/leave_status.dart';
import 'package:hrm_emedicare/components/customnavbar.dart';
import 'package:hrm_emedicare/data/controller/leave_controller/leave_controller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

// ignore: must_be_immutable
class Leave extends StatelessWidget {
  Leave({super.key});
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
    // ignore: unused_local_variable
    final cnt = Get.put(LeaveController());
    return Scaffold(
      bottomNavigationBar: Customnavbar(
          // index: 2,
          ),
      backgroundColor: ColorManager.kWhiteColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: ColorManager.kblackColor,
          ),
        ),
        title: Text(
          "leaveinfo".tr,
          style: GoogleFonts.poppins(
              fontSize: 20.h,
              color: ColorManager.kOrangeColor,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorManager.kWhiteColor,
      ),
      body: GetBuilder<LeaveController>(builder: (cnt) {
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
                0: Text(
                  "applyleaves".tr,
                  style: GoogleFonts.poppins(
                    color: cnt.index == 0
                        ? Colors.white
                        : ColorManager.kblackColor,
                  ),
                ),
                1: Text(
                  "leavestatus".tr,
                  style: GoogleFonts.poppins(
                    color: cnt.index == 1
                        ? Colors.white
                        : ColorManager.kblackColor,
                  ),
                ),
              },
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              // padding: 10,
              thumbDecoration: BoxDecoration(
                // boxShadow: const [
                //   BoxShadow(
                //     offset: Offset(1, 1),
                //     color: ColorManager.kGreyColor,
                //     spreadRadius: 1,
                //     blurRadius: 1,
                //   ),
                //   BoxShadow(
                //     offset: Offset(-1, -1),
                //     spreadRadius: 1,
                //     blurRadius: 1,
                //     color: ColorManager.kGreyColor,
                //   )
                // ],
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
    const ApplyLeave(),
    const LeaveStatus(),
  ];
}
