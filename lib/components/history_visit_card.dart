import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/data/controller/visitoutsidecontroller/visitoutsidecontroller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

// ignore: must_be_immutable
class HistoryVisitCard extends StatelessWidget {
  Color trailingcolor;
  String text;
  HistoryVisitCard(
      {super.key, required this.trailingcolor, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 06),
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.kmehrooncolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: GetBuilder<VisitOutsideController>(builder: (context) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height * 0.015),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorManager.kWhiteColor,
                      borderRadius: BorderRadius.circular(10),
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
                                "forwardedtoo".tr,
                                style: GoogleFonts.poppins(
                                    color: ColorManager.kblackColor,
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.bold),
                              ),
                              // SizedBox(
                              //   height: 05.h,
                              // ),
                              Text(
                                "HR Mr Shariq",
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
                                "total".tr,
                                style: GoogleFonts.poppins(
                                    color: ColorManager.kblackColor,
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.bold),
                              ),
                              // SizedBox(
                              //   height: 05.h,
                              // ),
                              Text(
                                " RS 400",
                                style: GoogleFonts.poppins(
                                  color: ColorManager.kblackColor,
                                  fontSize: 14.h,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.height * 0.02,
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
                            children: [
                              Text(
                                "addresss".tr,
                                style: GoogleFonts.poppins(
                                    color: ColorManager.kblackColor,
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "from:".tr,
                                style: GoogleFonts.poppins(
                                    color: ColorManager.kblackColor,
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 01.w,
                              ),
                              Text(
                                "e-Medicare Solution Office",
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
                                "to:".tr,
                                style: GoogleFonts.poppins(
                                    color: ColorManager.kblackColor,
                                    fontSize: 14.h,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 01.w,
                              ),
                              Text(
                                "RIC",
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
                                          "Nov 23, 2023",
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
                                          "totime".tr,
                                          style: GoogleFonts.poppins(
                                            color: ColorManager.kGreyColor,
                                            fontSize: 15.h,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 05.h,
                                        ),
                                        Text(
                                          "Nov 23, 2023",
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
                                    SizedBox(
                                      width: Get.width * 0.2,
                                      child: Column(
                                        children: [
                                          Text(
                                            "totaldays".tr,
                                            maxLines: 1,
                                            style: GoogleFonts.poppins(
                                              color: ColorManager.kGreyColor,
                                              fontSize: 15.h,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            height: 05.h,
                                          ),
                                          Text(
                                            "1 Day",
                                            style: GoogleFonts.poppins(
                                              color: ColorManager.kblackColor,
                                              fontSize: 15.h,
                                            ),
                                          ),
                                        ],
                                      ),
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
                                children: [
                                  Text(
                                    "expense".tr,
                                    style: GoogleFonts.poppins(
                                        color: ColorManager.kblackColor,
                                        fontSize: 14.h,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 01.w,
                                  ),
                                  Text(
                                    "Visit Hospital",
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
                                    "discription:".tr,
                                    style: GoogleFonts.poppins(
                                        color: ColorManager.kblackColor,
                                        fontSize: 14.h,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 01.w,
                                  ),
                                  Text(
                                    "I Have an urgent work in RIC",
                                    style: GoogleFonts.poppins(
                                      color: ColorManager.kblackColor,
                                      fontSize: 14.h,
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
      ),
    );
  }
}
