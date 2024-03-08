import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/View/auth_screen/forget_password/create_newpassword.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/components/primary_button.dart';
import 'package:hrm_emedicare/data/controller/forgot_passwordcontroller/Forget_password_controller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var forgotpasswordcontroller =
      Get.put<ForgotPasswordController>(ForgotPasswordController());
  @override
  void initState() {
    ForgotPasswordController.i.timer = 300.obs;
    ForgotPasswordController.i.startTimer(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    ForgotPasswordController.i.resetTimerAndUpdate();
    ForgotPasswordController.i.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "${'expirein'.tr} ${forgotpasswordcontroller.timer ~/ 60}:${forgotpasswordcontroller.timer % 60}",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: ColorManager.kblackColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Center(
                  child: PrimaryButton(
                      title: 'verifycode'.tr,
                      fontSize: 15,
                      fontweight: FontWeight.bold,
                      onPressed: () async {
                        Get.offAll(const CreateNewPasswordScreen());
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
