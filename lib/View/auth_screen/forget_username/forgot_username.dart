import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/View/auth_screen/forget_username/otp_user.dart';
import 'package:hrm_emedicare/View/auth_screen/login.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/components/primary_button.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

// ignore: must_be_immutable
class ForgotUsername extends StatelessWidget {
  ForgotUsername({super.key});

  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        child: Form(
          key: _formKey,
          child: Container(
            decoration: const BoxDecoration(
              color: ColorManager.kWhiteColor,
              // image: DecorationImage(
              //   image: AssetImage(
              //     Images.logo,
              //   ),
              // ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * 0.12,
                ),
                Center(
                  child: Image.asset(
                    Images.logo,
                    height: Get.height * 0.07,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.12,
                ),
                Text(
                  'forgetusername'.tr,
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: ColorManager.kOrangeColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Text(
                  'ithappenkindlyenteremail'.tr,
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: ColorManager.kblackColor,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                AuthTextField(
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'pleaseentermail'.tr;
                    }
                    return null;
                  },
                  controller: emailController,
                  hintText: 'emailaddress'.tr,
                ),
                SizedBox(
                  height: Get.height * 0.15,
                ),
                PrimaryButton(
                    title: 'submitt'.tr,
                    fontSize: 15,
                    fontweight: FontWeight.bold,
                    onPressed: () async {
                      Get.offAll(const OtpUserscreen());
                      if (_formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();

                        // try {
                        //   await AuthRepo.login(
                        //       cnic: login.emailController.text,
                        //       password:
                        //           login.passwordController.text);
                        // } catch (e) {}
                      }
                    },
                    color: ColorManager.kPrimaryColor,
                    textcolor: ColorManager.kWhiteColor),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                PrimaryButton(
                  title: 'cancel'.tr,
                  fontSize: 15,
                  fontweight: FontWeight.bold,
                  border: Border.all(),
                  onPressed: () async {
                    Get.back();
                    // Get.offAll(const DrawerScreen());
                  },
                  color: ColorManager.kWhiteColor,
                  textcolor: ColorManager.kblackColor,
                ),
                const Spacer(),
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
                SizedBox(
                  height: Get.height * 0.02,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
