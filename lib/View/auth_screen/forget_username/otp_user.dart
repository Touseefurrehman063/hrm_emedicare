import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/View/auth_screen/forget_username/create_new_username.dart';
import 'package:hrm_emedicare/View/auth_screen/login.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/components/primary_button.dart';
import 'package:hrm_emedicare/data/controller/forgot_username/forgot_username.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpUserscreen extends StatefulWidget {
  const OtpUserscreen({super.key});

  @override
  State<OtpUserscreen> createState() => _OtpUserscreenState();
}

class _OtpUserscreenState extends State<OtpUserscreen> {
  var forgotusername =
      Get.put<ForgotUsernameController>(ForgotUsernameController());
  @override
  void initState() {
    ForgotUsernameController.i.timer = 300.obs;
    ForgotUsernameController.i.startTimer(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    ForgotUsernameController.i.resetTimerAndUpdate();
    ForgotUsernameController.i.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
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
                Center(
                  child: Text(
                    'enterotp'.tr,
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        color: ColorManager.kOrangeColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Center(
                  child: Text(
                    'thanku'.tr,
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: ColorManager.kblackColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    'otpsend'.tr,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: ColorManager.kblackColor,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'aqib@gmail.com',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: ColorManager.kblackColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                OtpTextField(
                  numberOfFields: 4,
                  fieldWidth: Get.width * 0.15,
                  borderColor: ColorManager.kGreyColor,
                  keyboardType: TextInputType.number,
                  margin: const EdgeInsets.all(8),
                  enabledBorderColor: ColorManager.kblackColor,
                  focusedBorderColor: ColorManager.kPrimaryColor,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    // AuthController.i.updatecode(verificationCode);
                  },
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Obx(
                  () => Center(
                    child: Text(
                      "${'expirein'.tr} ${forgotusername.timer ~/ 60}:${forgotusername.timer % 60}",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: ColorManager.kblackColor,
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: Get.height * 0.02,
                // ),
                Center(
                  child: PrimaryButton(
                      title: 'verifycode'.tr,
                      fontSize: 15,
                      fontweight: FontWeight.bold,
                      onPressed: () async {
                        Get.offAll(const CreateNewUsernameScreen());
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
                      color: ColorManager.kPrimaryColor,
                      textcolor: ColorManager.kWhiteColor),
                  // ForgotPasswordController.i.onClose();
                  //   ForgotPasswordController.i.resetTimerAndUpdate();
                ),
                // const Spacer(),
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
