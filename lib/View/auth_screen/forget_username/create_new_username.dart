import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/View/auth_screen/forget_username/new_username_success.dart';
import 'package:hrm_emedicare/View/auth_screen/login.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/components/primary_button.dart';
import 'package:hrm_emedicare/data/controller/forgot_username/forgot_username.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

class CreateNewUsernameScreen extends StatefulWidget {
  const CreateNewUsernameScreen({super.key});

  @override
  State<CreateNewUsernameScreen> createState() =>
      _CreateNewUsernameScreenState();
}

class _CreateNewUsernameScreenState extends State<CreateNewUsernameScreen> {
  var forgotusername =
      Get.put<ForgotUsernameController>(ForgotUsernameController());

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
                        'createusername'.tr,
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
                        'kindlyenterusername'.tr,
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
                          forgotusername
                              .updatenewpassword(!forgotusername.newpassword);
                        },
                        child: forgotusername.newpassword
                            ? const Icon(CupertinoIcons.eye_slash)
                            : const Icon(CupertinoIcons.eye),
                      ),
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'pleaseentername'.tr;
                        }
                        return null;
                      },
                      controller: forgotusername.passwordController,
                      hintText: 'newusername'.tr,
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    AuthTextField(
                      // obscureText: forgotpasswordcontroller.newconfirmpassword,
                      suffixIcon: InkWell(
                        onTap: () {
                          forgotusername.updatenewconfirmpassword(
                              !forgotusername.newconfirmpassword);
                        },
                        child: forgotusername.newconfirmpassword
                            ? const Icon(CupertinoIcons.eye_slash)
                            : const Icon(CupertinoIcons.eye),
                      ),
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return 'pleasenterconfirmname'.tr;
                        }
                        return null;
                      },
                      controller: forgotusername.comfirmController,
                      hintText: 'confirmnewname'.tr,
                    ),
                    SizedBox(
                      height: Get.height * 0.07,
                    ),
                    Center(
                      child: PrimaryButton(
                          title: 'submitt'.tr,
                          fontSize: 15,
                          fontweight: FontWeight.bold,
                          onPressed: () async {
                            Get.offAll(const NewUsernameSuccess());
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
        ),
      ),
    );
  }
}
