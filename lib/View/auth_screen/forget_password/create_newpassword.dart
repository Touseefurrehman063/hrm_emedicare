import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/View/auth_screen/forget_password/password_success.dart';
import 'package:hrm_emedicare/View/auth_screen/login.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/components/primary_button.dart';
import 'package:hrm_emedicare/data/controller/forgot_passwordcontroller/Forget_password_controller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  var forgotpasswordcontroller =
      Get.put<ForgotPasswordController>(ForgotPasswordController());

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: Form(
              key: _formKey,
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorManager.kWhiteColor,
                  // image: DecorationImage(
                  //   image: AssetImage(
                  //     Images.backgroundimageCrop,
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
                        'createnewpass'.tr,
                        style: GoogleFonts.poppins(
                            fontSize: 25,
                            color: ColorManager.kOrangeColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Center(
                      child: Text(
                        'kindlyenteruniquepass'.tr,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: ColorManager.kblackColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    AuthTextField(
                      // obscureText: forgotpasswordcontroller.newpassword,
                      suffixIcon: InkWell(
                        onTap: () {
                          forgotpasswordcontroller.updatenewpassword(
                              !forgotpasswordcontroller.newpassword);
                        },
                        child: forgotpasswordcontroller.newpassword
                            ? const Icon(CupertinoIcons.eye_slash)
                            : const Icon(CupertinoIcons.eye),
                      ),
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'pleaseenternewpass'.tr;
                        }
                        return null;
                      },
                      controller: forgotpasswordcontroller.passwordController,
                      hintText: 'newpass'.tr,
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    AuthTextField(
                      // obscureText: forgotpasswordcontroller.newconfirmpassword,
                      suffixIcon: InkWell(
                        onTap: () {
                          forgotpasswordcontroller.updatenewconfirmpassword(
                              !forgotpasswordcontroller.newconfirmpassword);
                        },
                        child: forgotpasswordcontroller.newconfirmpassword
                            ? const Icon(CupertinoIcons.eye_slash)
                            : const Icon(CupertinoIcons.eye),
                      ),
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'pleaseenterconfirmpass'.tr;
                        }
                        return null;
                      },
                      controller: forgotpasswordcontroller.comfirmController,
                      hintText: 'confirmnewpass'.tr,
                    ),
                    SizedBox(
                      height: Get.height * 0.09,
                    ),
                    Center(
                      child: PrimaryButton(
                          title: 'submitt'.tr,
                          fontSize: 15,
                          fontweight: FontWeight.bold,
                          onPressed: () async {
                            Get.offAll(const NewPasswordSucess());
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
        ),
      ),
    );
  }
}
