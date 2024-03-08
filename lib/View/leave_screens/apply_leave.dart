import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/View/auth_screen/login.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/components/custom_textfield/lmpc_custom_textfield.dart';
import 'package:hrm_emedicare/components/customattendancecard.dart';
import 'package:hrm_emedicare/components/customforwardcard.dart';
import 'package:hrm_emedicare/components/image_container/images_container.dart';
import 'package:hrm_emedicare/components/primary_button.dart';
import 'package:hrm_emedicare/components/searchable_dropdown.dart';
import 'package:hrm_emedicare/data/controller/auth_controller/auth_controller.dart';
import 'package:hrm_emedicare/data/controller/leave_controller/leave_controller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

class ApplyLeave extends StatelessWidget {
  const ApplyLeave({super.key});
  static bool checkval = true;

  @override
  Widget build(BuildContext context) {
    Get.put(LeaveController());
    LeaveController.i.getdepaartment(AuthController.i.userProfile?.id);
    LeaveController.i.getleavetype();
    LeaveController.i.getleavebalance();
    LeaveController.i.getlinemanager();
    // ignore: unused_local_variable
    final lev = Get.put(LeaveController());
    final cont = Get.find<LeaveController>();
    cont.updateleaves();
    int remainingLeaves() {
      int allocatedLeaves =
          int.parse(cont.leavebalance?.allocatedLeaves?.toString() ?? "0");
      int availedLeaves =
          int.parse(cont.leavebalance?.availedLeaves?.toString() ?? "0");
      return allocatedLeaves - availedLeaves;
    }

    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: GetBuilder<LeaveController>(builder: (cont) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.05,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Customattandencestatuscard(
                      color: const Color(0xff23B480),
                      title: 'annual'.tr,
                      total: cont.annual?.allocatedLeaves?.toString() ?? "0",
                      count: cont.annual?.availedLeaves?.toString() ?? "0",
                    ),
                    Customattandencestatuscard(
                        color: const Color(0xffFF455E),
                        title: 'sick'.tr,
                        total: cont.sick?.allocatedLeaves?.toString() ?? "0",
                        count: cont.sick?.allocatedLeaves?.toString() ?? "0"),
                    Customattandencestatuscard(
                        color: const Color(0xff663CDE),
                        title: 'casual'.tr,
                        total: cont.casual?.allocatedLeaves?.toString() ?? "0",
                        count: cont.casual?.allocatedLeaves?.toString() ?? "0"),
                    Customattandencestatuscard(
                        color: const Color(0xffF2B42A),
                        title: 'other'.tr,
                        total: cont.other?.allocatedLeaves?.toString() ?? "0",
                        count: cont.other?.allocatedLeaves?.toString() ?? "0"),
                  ],
                ),
                SizedBox(height: Get.height * 0.03),
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
                        hintText: cont.selecteddepartment?.name ??
                            "selectdepartment".tr,
                        suffixIcon: const Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                          // color: selectedGender != null
                          //     ? Colors.black
                          //     : Colors.black,
                        )),
                    readOnly: true,
                    onTap: () async {
                      log(jsonEncode(cont.department));
                      dynamic generic = await searchableDropdown(
                          context, cont.department ?? []);
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
                cont.selecteddepartment == null && cont.chk == true
                    ? Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              "pleaseselectdept".tr,
                              style: GoogleFonts.poppins(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: cont.selectedLeaveType,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.green),
                        onChanged: (value) {
                          cont.updateleave(value);
                        },
                        activeColor: ColorManager.kgreencolorstatus,
                        focusColor: ColorManager.kgreencolorstatus,
                      ),
                      Text("leaveduration".tr),
                      SizedBox(
                        width: 5.w,
                      ),
                      Radio(
                        value: 2,
                        groupValue: cont.selectedLeaveType,
                        fillColor: MaterialStateColor.resolveWith(
                            (states) => Colors.green),
                        onChanged: (value) {
                          cont.updateleave(value);
                        },
                        activeColor: ColorManager.kgreencolorstatus,
                        focusColor: ColorManager.kgreencolorstatus,
                      ),
                      Text("shortleave".tr),
                    ],
                  ),
                ),

                cont.selectedLeaveType == 1
                    ? Row(
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
                                  border: Border.all(
                                      color: ColorManager.kOrangeColor),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
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
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
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
                                  border: Border.all(
                                      color: ColorManager.kOrangeColor),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
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
                      )
                    :
                    // SizedBox(
                    //   height: Get.height * 0.03,
                    // ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () async {
                              final time = await cont.selectTime(context);
                              cont.updatetime(time);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorManager.kOrangeColor),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: const Padding(
                                        padding: EdgeInsets.all(4),
                                        child: Icon(
                                          Icons.timer_outlined,
                                          color: ColorManager.kOrangeColor,
                                        )),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
                                  Text(cont.formattedTime(cont.selectedTime)),
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          const Text(
                            "-",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          InkWell(
                            onTap: () async {
                              final time1 = await cont.selectTime1(context);
                              cont.updatetime1(time1);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: ColorManager.kOrangeColor),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(4),
                                      child: Icon(
                                        Icons.timer_outlined,
                                        color: ColorManager.kOrangeColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
                                  Text(cont.formattedTime(cont.selectedTime1)),
                                  SizedBox(
                                    width: Get.width * 0.03,
                                  ),
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
                      border: Border.all(color: ColorManager.kOrangeColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
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
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              hintText: cont.selectleavetype?.name ??
                                  "selectleavetype".tr,
                              suffixIcon: const Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                // color: selectedGender != null
                                //     ? Colors.black
                                //     : Colors.black,
                              )),
                          readOnly: true,
                          onTap: () async {
                            dynamic generic = await searchableDropdown(
                                context, cont.leavetype ?? []);
                            if (generic != null && generic != '') {
                              cont.updateleavetypeobject(generic);
                              LeaveController.i.getleavebalance();
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
                              return "pleaseselectleavetype".tr;
                            }
                            return null;
                          },
                          onChanged: (value) {
                            // Handle the onChanged event if needed
                          },
                        ),
                      ),
                      // cont.selectleavetype?.name == null && cont.chk == true
                      //     ? const Row(
                      //         children: [
                      //           Padding(
                      //             padding: EdgeInsets.symmetric(
                      //                 horizontal: 10, vertical: 5),
                      //             child: Text(
                      //               "Please Select Leave Type",
                      //               style: TextStyle(
                      //                 color: Colors.red,
                      //                 fontSize: 12,
                      //                 fontWeight: FontWeight.w500,
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       )
                      //     : const SizedBox.shrink(),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Text(
                              "allowed".tr,
                              style: const TextStyle(
                                  color: ColorManager.kgreencolorstatus,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "${cont.leavebalance?.allocatedLeaves ?? "0"}",
                              style: const TextStyle(
                                  color: ColorManager.kblackColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            const Text(
                              "|",
                              style: TextStyle(
                                  color: ColorManager.kblackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "avail".tr,
                              style: const TextStyle(
                                  color: ColorManager.kOrangeColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "${cont.leavebalance?.availedLeaves ?? "0"}",
                              style: const TextStyle(
                                  color: ColorManager.kblackColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            const Text(
                              "|",
                              style: TextStyle(
                                  color: ColorManager.kblackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "remaining".tr,
                              style: const TextStyle(
                                  color: ColorManager.kblackColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              "${remainingLeaves()}",
                              style: const TextStyle(
                                  color: ColorManager.kblackColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),

                AuthTextField(
                  label: Text(
                    "title".tr,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: ColorManager.kblackColor),
                  ),
                  controller: cont.titleController,
                  validator: (p0) {
                    if (p0 == " ") {
                      return 'pleaseentertitle'.tr;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),

                AuthTextField(
                  label: Text(
                    "discription".tr,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: ColorManager.kblackColor),
                  ),
                  controller: cont.descripController,
                  maxLines: 8,
                  validator: (p0) {
                    if (p0 == "\n") {
                      return 'pleaseenterdescription'.tr;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                RegisterLMPCCustomTextField(
                  readonly: true,
                  onTap: () {
                    cont.picksinglefile();
                  },
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: SizedBox(
                              width: Get.width * 0.68,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: checkval
                                        ? OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: ColorManager
                                                  .kgreencolorstatus,
                                              width: 0.8,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )
                                        : OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: ColorManager
                                                  .kgreencolorstatus,
                                              width: 0.8,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                    ),
                                    hintText: cont.selectedmanager?.name ??
                                        "forwardedto".tr,
                                    suffixIcon: const Icon(
                                      Icons.arrow_drop_down,
                                      size: 20,
                                      // color: selectedGender != null
                                      //     ? Colors.black
                                      //     : Colors.black,
                                    )),
                                readOnly: true,
                                onTap: () async {
                                  dynamic generic = await searchableDropdown(
                                      context, cont.linemanagerList ?? []);
                                  if (generic != null && generic != '') {
                                    cont.updatelinemanagerobject(generic);
                                  }
                                },
                                style: TextStyle(
                                  fontSize: 12,
                                  color: cont.selectedmanager != null
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                                validator: (value) {
                                  if (cont.selectedmanager == null) {
                                    return "pleaseselectlinemanager".tr;
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  // Handle the onChanged event if needed
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * 0.03,
                          ),
                          InkWell(
                            onTap: () {
                              cont.addlinemanager(cont.selectedmanager);
                            },
                            child: const ImageContainer(
                              imagePath: Images.plus,
                              backgroundColor: ColorManager.kgreencolorstatus,
                              color: ColorManager.kWhiteColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Wrap(
                        direction: Axis
                            .horizontal, // Make sure items are laid out horizontally
                        runSpacing: 2.0,
                        children: <Widget>[
                          for (int index = 0;
                              index < cont.selectedlinemanagerlist.length;
                              index++)
                            CustomForwardcard(
                                obj: cont.selectedlinemanagerlist[index]),
                        ],
                      ),
                    ],
                  ),
                ),
                // cont.selectedmanager?.name == null && cont.chk == true
                //     ? const Row(
                //         children: [
                //           Padding(
                //             padding: EdgeInsets.symmetric(
                //                 horizontal: 10, vertical: 5),
                //             child: Text(
                //               "Please Select Line Manager",
                //               style: TextStyle(
                //                 color: Colors.red,
                //                 fontSize: 12,
                //                 fontWeight: FontWeight.w500,
                //               ),
                //             ),
                //           ),
                //         ],
                //       )
                //     : const SizedBox.shrink(),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                PrimaryButton(
                    title: 'submitt'.tr,
                    fontSize: 15,
                    fontweight: FontWeight.bold,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        if (cont.pmcfile != null) {
                          await LeaveController.i.getsubmitleave();
                          LeaveController.i.updateindex(1);
                        } else {
                          Fluttertoast.showToast(
                              msg: 'pleaseselectfile'.tr,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: ColorManager.kRedColor,
                              textColor: ColorManager.kWhiteColor,
                              fontSize: 14.0);
                        }
                        // ignore: use_build_context_synchronously
                        FocusScope.of(context).unfocus();
                      }

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
          );
        }),
      ),
    );
  }
}
