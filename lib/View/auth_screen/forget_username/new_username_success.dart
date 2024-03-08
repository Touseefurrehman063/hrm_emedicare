import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/View/auth_screen/login.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

class NewUsernameSuccess extends StatefulWidget {
  const NewUsernameSuccess({super.key});

  @override
  State<NewUsernameSuccess> createState() => _NewUsernameSuccessState();
}

class _NewUsernameSuccessState extends State<NewUsernameSuccess> {
  @override
  void initState() {
    super.initState();
    navigateToLogin();
  }

  void navigateToLogin() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.to(() => Login());
    });
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
              //     Images.backgroundimageCrop,
              //   ),
              // ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                SizedBox(
                  height: Get.height * 0.15,
                  width: Get.width * 0.9,
                  child: Image.asset(
                    Images.thumb,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.06,
                ),
                Center(
                  child: Text(
                    'thanku'.tr,
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: ColorManager.kblackColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Center(
                  child: Text(
                    'youwillredirected'.tr.tr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: ColorManager.kblackColor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                RichText(
                  text: TextSpan(
                    text: 'click'.tr,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.kblackColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        onEnter: (event) {
                          Get.to(Login());
                        },
                        text: 'here'.tr,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.kOrangeColor,
                        ),
                      ),
                      TextSpan(
                        text: 'ifyounotredirect'.tr,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.kblackColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SignupOrLoginText(
                  pre: 'needhelp'.tr,
                  suffix: 'helpcenter'.tr,
                  onTap: () {
                    //Get.to(() => const RegisterScreens());
                    launchWhatsApp();
                    // Get.to(NoDataFound());
                  },
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
