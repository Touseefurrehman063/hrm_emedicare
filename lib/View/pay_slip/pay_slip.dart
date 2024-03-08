import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/View/pay_slip/3_months_slips.dart';
import 'package:hrm_emedicare/View/pay_slip/6_months.dart';
import 'package:hrm_emedicare/View/pay_slip/all_slips.dart';
import 'package:hrm_emedicare/data/controller/paycontroller/paycontroller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

// ignore: must_be_immutable
class PaySlip extends StatelessWidget {
  PaySlip({super.key});

  @override
  Widget build(BuildContext context) {
    final cont = Get.put(PaySlipController());
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: ColorManager.kWhiteColor,
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
            "payslip".tr,
            style: GoogleFonts.poppins(
                fontSize: 20.h,
                color: ColorManager.kOrangeColor,
                fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            onTap: (c) {
              cont.updateindex(c);
            },
            indicatorColor: ColorManager.kWhiteColor,
            labelColor: ColorManager.kblackColor,
            unselectedLabelColor: ColorManager.kGreyColor,
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            tabs: [
              Text("all".tr),
              Text('3months'.tr),
              Text('6months'.tr),
            ],
          ),
        ),
        body: TabBarView(
          children: pages,
        ),
      ),
    );
  }

  List<Widget> pages = [
    AllSlips(),
    ThreeMonthslip(),
    SixMonths(),
  ];
}
