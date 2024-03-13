import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/View/auth_screen/login.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/components/primary_button.dart';
import 'package:hrm_emedicare/data/controller/change_password_controller/change_password_controller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:hrm_emedicare/utils/class_toaster.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});
  static final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var changepass = Get.put(ChangePassController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        elevation: 0,
        backgroundColor: ColorManager.kWhiteColor,
      ),
      body: SafeArea(
        child: GetBuilder<ChangePassController>(builder: (cont) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: ColorManager.kWhiteColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: Get.height * 0.12),
                        Center(
                          child: Image.asset(
                            Images.logo,
                            height: Get.height * 0.07,
                          ),
                        ),
                        SizedBox(height: Get.height * 0.08),
                        Center(
                          child: Text(
                            'changepass'.tr,
                            style: GoogleFonts.poppins(
                                fontSize: 25,
                                color: ColorManager.kOrangeColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.08),
                        AuthTextField(
                          suffixIcon: InkWell(
                            onTap: () {
                              cont.updateoldpassword(!cont.oldpassword);
                            },
                            child: changepass.oldpassword
                                ? const Icon(CupertinoIcons.eye_slash)
                                : const Icon(CupertinoIcons.eye),
                          ),
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'pleaseoldpassword'.tr;
                            }
                            return null;
                          },
                          controller: changepass.oldpasswordController,
                          hintText: 'oldpassword'.tr,
                          maxLines: 1,
                          obscureText: cont.oldpassword,
                        ),
                        SizedBox(height: Get.height * 0.02),
                        AuthTextField(
                          suffixIcon: InkWell(
                            onTap: () {
                              changepass
                                  .updatenewpassword(!changepass.newpassword);
                            },
                            child: changepass.newpassword
                                ? const Icon(CupertinoIcons.eye_slash)
                                : const Icon(CupertinoIcons.eye),
                          ),
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'pleasenewpassword'.tr;
                            }
                            return null;
                          },
                          controller: changepass.newpasswordcontroller,
                          hintText: 'newpassword'.tr,
                          maxLines: 1,
                          obscureText: cont.newpassword,
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        AuthTextField(
                          suffixIcon: InkWell(
                            onTap: () {
                              changepass.updatenewconfirmpassword(
                                  !changepass.newconfirmpassword);
                            },
                            child: changepass.newconfirmpassword
                                ? const Icon(CupertinoIcons.eye_slash)
                                : const Icon(CupertinoIcons.eye),
                          ),
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'pleaseconfirmpassword'.tr;
                            }
                            return null;
                          },
                          controller: changepass.newcomfirmpassController,
                          hintText: 'confirmpassword'.tr,
                          maxLines: 1,
                          obscureText: cont.newconfirmpassword,
                        ),
                        SizedBox(height: Get.height * 0.15),
                        Center(
                          child: PrimaryButton(
                            title: 'submitt'.tr,
                            fontSize: 15,
                            fontweight: FontWeight.bold,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                if (changepass.newpasswordcontroller.text !=
                                    changepass.newcomfirmpassController.text) {
                                  Showtoaster().classtoaster("Newandconfirm".tr,
                                      ColorManager.kPrimaryColor);
                                } else {
                                  try {
                                    cont.updatepassword();
                                  } catch (e) {
                                    log("$e");
                                  }
                                }
                              }
                            },
                            color: ColorManager.kPrimaryColor,
                            textcolor: ColorManager.kWhiteColor,
                          ),
                        ),
                        SizedBox(height: Get.height * 0.04),
                        Center(
                            child: SignupOrLoginText(
                          pre: 'needhelp'.tr,
                          suffix: 'helpcenter'.tr,
                          onTap: () {
                            //Get.to(() => const RegisterScreens());
                            launchWhatsApp();
                            // Get.to(NoDataFound());
                          },
                        )),
                        SizedBox(height: Get.height * 0.02),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
