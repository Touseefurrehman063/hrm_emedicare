import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/View/auth_screen/forget_password/otp_screen.dart';
import 'package:hrm_emedicare/View/auth_screen/login.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/components/primary_button.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

// ignore: must_be_immutable
class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'forgettpass'.tr,
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
                      Get.offAll(const OtpScreen());
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
                  child: RichText(
                    text: TextSpan(
                      text: 'needhelp'.tr,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ColorManager.kblackColor,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'helpcenter'.tr,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorManager.kOrangeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
