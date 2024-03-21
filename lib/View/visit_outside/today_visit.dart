import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hrm_emedicare/View/auth_screen/login.dart';
import 'package:hrm_emedicare/components/Customamountcard.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/components/customforwardcard.dart';
import 'package:hrm_emedicare/components/image_container/images_container.dart';
import 'package:hrm_emedicare/components/primary_button.dart';
import 'package:hrm_emedicare/components/searchable_dropdown.dart';
import 'package:hrm_emedicare/data/controller/auth_controller/auth_controller.dart';
import 'package:hrm_emedicare/data/controller/leave_controller/leave_controller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

// ignore: must_be_immutable
class TodayVisit extends StatelessWidget {
  const TodayVisit({super.key});
  static bool checkval = true;

  @override
  Widget build(BuildContext context) {
    AuthController.i.getdepaartment(AuthController.i.userProfile?.id);
    var cont = Get.put<AuthController>(AuthController());
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: TextFormField(
                decoration: InputDecoration(
                    border: checkval
                        ? OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorManager.kgreencolorstatus,
                              width: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          )
                        : OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: ColorManager.kgreencolorstatus,
                              width: 0.8,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    hintText:
                        cont.selecteddepartment?.name ?? "selectdepartment".tr,
                    suffixIcon: const Icon(
                      Icons.arrow_drop_down,
                      size: 20,
                      // color: selectedGender != null
                      //     ? Colors.black
                      //     : Colors.black,
                    )),
                readOnly: true,
                onTap: () async {
                  cont.getdepaartment(AuthController.i.userProfile?.id);
                  log(jsonEncode(cont.department));
                  dynamic generic =
                      await searchableDropdown(context, cont.department ?? []);
                  if (generic != null && generic.name != '') {
                    cont.updatesubdepartment(generic);
                  }
                },
                style: TextStyle(
                  fontSize: 12,
                  color: cont.selecteddepartment != null
                      ? Colors.black
                      : Colors.grey,
                ),
                validator: (value) {
                  if (cont.selecteddepartment == null) {
                    return "pleaseselectdept".tr;
                  }
                  return null;
                },
                onChanged: (value) {
                  // Handle the onChanged event if needed
                },
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    final date = await cont.selectDate(context);
                    cont.updateselecteddate(date);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorManager.kOrangeColor),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: const Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.calendar_today_outlined,
                                color: ColorManager.kOrangeColor,
                              )),
                        ),
                        Text(
                            "${cont.formattedDate(cont.selectedDate.toString())}")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                const Text(
                  "-",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 5.w,
                ),
                InkWell(
                  onTap: () async {
                    final date = await cont.selectDate1(context);
                    cont.updateselecteddate1(date);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorManager.kOrangeColor),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: const Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.calendar_today_outlined,
                                color: ColorManager.kOrangeColor,
                              )),
                        ),
                        Text(
                            "${cont.formattedDate(cont.selectedDate1.toString())}")
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.kGreyColor),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  Text(
                    "address".tr,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  GetBuilder<AuthController>(builder: (cont) {
                    return AuthTextField(
                      label: Text(
                        "from".tr,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.kblackColor),
                      ),
                      controller:
                          cont.fromcontroller, //data must be pass by .trim
                    );
                  }),
                  SizedBox(height: Get.height * 0.02),
                  GetBuilder<AuthController>(builder: (cont) {
                    return AuthTextField(
                      label: Text(
                        "to".tr,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: ColorManager.kblackColor),
                      ),
                      controller:
                          cont.tocontroller, //data must be pass by .trim
                    );
                  }),
                  SizedBox(height: Get.height * 0.02),
                  GetBuilder<AuthController>(builder: (cont) {
                    return InkWell(
                      onTap: () {
                        cont.updateAddresses();
                      },
                      child: ImageContainer(
                        height: Get.height * 0.06,
                        width: Get.width * 1,
                        imagePath: Images.plus,
                        backgroundColor: ColorManager.kgreencolorstatus,
                        color: ColorManager.kWhiteColor,
                      ),
                    );
                  }),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  GetBuilder<AuthController>(builder: (cont) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                Images.addressicon,
                                height: Get.height * 0.13,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: Get.width * 0.04,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("from".tr),
                              Text(
                                cont.fromAddress,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              Text("to".tr),
                              Text(
                                cont.toAddress,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  })
                ],
              ),
            ),

            SizedBox(
              height: Get.height * 0.05,
            ),
            AuthTextField(
              visitoutside: true,
              label: Text(
                "discription".tr,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.kblackColor),
              ),
              controller: cont.titleController,
              maxLines: 8,
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            PrimaryButton(
                title: 'attachfile'.tr,
                fontSize: 15,
                fontweight: FontWeight.bold,
                onPressed: () async {
                  LeaveController.i.picksinglefile();
                },
                color: ColorManager.kOrangeColor,
                textcolor: ColorManager.kWhiteColor),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.kOrangeColor),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: AuthTextField(
                          hintText: 'expensetype'.tr,
                          bordercolor: ColorManager.kgreencolorstatus,
                          controller: cont.expenseController,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.01,
                      ),
                      Flexible(
                          child: AuthTextField(
                        hintText: 'addamount'.tr,
                        bordercolor: ColorManager.kgreencolorstatus,
                        controller: cont.amountController,
                      )),
                      SizedBox(
                        width: Get.width * 0.03,
                      ),
                      const ImageContainer(
                        imagePath: Images.plus,
                        backgroundColor: ColorManager.kgreencolorstatus,
                        color: ColorManager.kWhiteColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const CustomAmountCard(),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.kOrangeColor),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () async {
                          // selecteddepartment = null;
                          // department.clear();
                          // await department();

                          dynamic generic =
                              await searchableDropdown(context, []);
                          if (generic != null && generic != '') {}
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: Row(
                            children: [
                              Container(
                                decoration: checkval
                                    ? BoxDecoration(
                                        border: Border.all(
                                            color:
                                                ColorManager.kgreencolorstatus,
                                            width: 0.8),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.transparent,
                                      )
                                    : BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 0.8),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.transparent,
                                      ),
                                width: MediaQuery.of(context).size.width * 0.68,
                                height:
                                    MediaQuery.of(context).size.height * 0.065,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.04),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Text(
                                      //   selectedGender != null
                                      //       ? gender
                                      //           .firstWhere((element) =>
                                      //               element.id ==
                                      //               selectedGender)
                                      //           .name
                                      //           .toString()
                                      //       : 'gender'.tr,
                                      //   style: TextStyle(
                                      //     fontSize: 12,
                                      //     color: selectedGender != null
                                      //         ? Colors.black
                                      //         : Colors.grey,
                                      //   ),
                                      // ),

                                      Row(
                                        children: [
                                          Text("forwardedto".tr),
                                          // Text(
                                          //   "*",
                                          //   style: TextStyle(
                                          //       color: ColorManager.kRedColor),
                                          // )
                                        ],
                                      ),
                                      const Icon(
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
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.03,
                      ),
                      const ImageContainer(
                        imagePath: Images.plus,
                        backgroundColor: ColorManager.kgreencolorstatus,
                        color: ColorManager.kWhiteColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const CustomForwardcard(),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            PrimaryButton(
                title: 'submitt'.tr,
                fontSize: 15,
                fontweight: FontWeight.bold,
                onPressed: () async {
                  // Get.offAll(const DrawerScreen());
                  // if (_formKey.currentState!.validate()) {
                  //   FocusScope.of(context).unfocus();

                  //   // try {
                  //   //   await AuthRepo.login(
                  //   //       cnic: login.emailController.text,
                  //   //       password:
                  //   //           login.passwordController.text);
                  //   // } catch (e) {}
                  // }
                },
                color: ColorManager.kgreencolorstatus,
                textcolor: ColorManager.kWhiteColor),

            // ListView.builder(
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemCount: 3,
            //     shrinkWrap: true,
            //     itemBuilder: (ctx, index) {
            //       return Attendancehistorycard(
            //         trailingcolor: ColorManager.kgreencolorstatus,
            //         text: "P",
            //       );
            //     })
            SizedBox(
              height: Get.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
