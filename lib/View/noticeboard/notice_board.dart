import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/View/noticeboard/notice_detail.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/components/customnavbar.dart';
import 'package:hrm_emedicare/components/searchable_dropdown.dart';
import 'package:hrm_emedicare/data/controller/NoticeBoard/noticeboardcontroller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

// ignore: must_be_immutable
class NoticeBoard extends StatelessWidget {
  NoticeBoard({super.key});
  bool checkval = true;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final cont = Get.put(NoticeBoardController());
    return Scaffold(
      bottomNavigationBar: Customnavbar(
          // index: 0,
          ),
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
          "Notice Board",
          style: GoogleFonts.poppins(
              fontSize: 20.h,
              color: ColorManager.kOrangeColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Filter",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        // selecteddepartment = null;
                        // department.clear();
                        // await department();

                        dynamic generic = await searchableDropdown(context, []);
                        if (generic != null && generic != '') {}
                      },
                      child: Container(
                        decoration: checkval
                            ? BoxDecoration(
                                border: Border.all(
                                    color: ColorManager.kblackColor,
                                    width: 0.8),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.transparent,
                              )
                            : BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 0.8),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.transparent,
                              ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("Month"),
                                ],
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                // color: selectedGender != null
                                //     ? Colors.black
                                //     : Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.03,
                    ),
                    InkWell(
                      onTap: () async {
                        // selecteddepartment = null;
                        // department.clear();
                        // await department();

                        dynamic generic = await searchableDropdown(context, []);
                        if (generic != null && generic != '') {}
                      },
                      child: Container(
                        decoration: checkval
                            ? BoxDecoration(
                                border: Border.all(
                                    color: ColorManager.kblackColor,
                                    width: 0.8),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.transparent,
                              )
                            : BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 0.8),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.transparent,
                              ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.04),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("Year"),
                                ],
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                // color: selectedGender != null
                                //     ? Colors.black
                                //     : Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            const Divider(
              thickness: 1,
              color: ColorManager.kGreyColor,
            ),
            // SizedBox(
            //   height: Get.height * 0.02,
            // ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => NoticeDetail());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: Get.width * 0.04,
                            vertical: Get.width * 0.03),
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: ColorManager.klightorange,
                          border: Border.all(
                            color: ColorManager.klightorange,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kashmeer Day Holiday Notification ",
                              style: GoogleFonts.poppins(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  Images.user,
                                  height: Get.height * 0.02,
                                ),
                                SizedBox(
                                  width: Get.width * 0.02,
                                ),
                                Text(
                                  "Sharique Raza",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.04,
                                ),
                                Image.asset(
                                  Images.calender,
                                  height: Get.height * 0.02,
                                ),
                                SizedBox(
                                  width: Get.width * 0.02,
                                ),
                                Text(
                                  "Jan 10, 2024",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
