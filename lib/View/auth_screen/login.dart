import 'dart:developer';
import 'dart:io';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hrm_emedicare/View/auth_screen/forget_password/forget_password.dart';
import 'package:hrm_emedicare/View/auth_screen/forget_username/forgot_username.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/components/primary_button.dart';
import 'package:hrm_emedicare/data/controller/auth_controller/auth_controller.dart';
import 'package:hrm_emedicare/data/localdb/localdb.dart';
import 'package:hrm_emedicare/data/repositories/auth_repository/auth_repo.dart';
import 'package:hrm_emedicare/data/repositories/biometric_auth/biometric_auth.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:hrm_emedicare/utils/class_toaster.dart';
import 'package:local_auth/local_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  Login({super.key});
  bool isfingerprintEnable = false;
  final LocalAuthentication auth = LocalAuthentication();

  call() async {
    String? username = await Prefs().getusername();
    String? userpassword = await Prefs().getpassword();

    isfingerprintEnable = await Prefs.getfingerprint();
    AuthController.i.updatefingerprint(isfingerprintEnable);
    if (username != "" && userpassword != "" && isfingerprintEnable) {
      bool auth = await Authentication.authentication();

      if (auth) {
        if (auth) {
          isfingerprintEnable = auth;
        }
        if (isfingerprintEnable) {
          if (auth) {
            if (AuthController.i.userProfile?.id != null) {
              // AuthRepo.login(username, userpassword, '');
              AuthController.i.getlogininformation(
                username,
                userpassword,
              );
              // Fluttertoast.showToast(
              //     msg: 'You are already Logged in',
              //     toastLength: Toast.LENGTH_SHORT,
              //     gravity: ToastGravity.BOTTOM,
              //     timeInSecForIosWeb: 1,
              //     backgroundColor: ColorManager.kRedColor,
              //     textColor: ColorManager.kWhiteColor,
              //     fontSize: 14.0);
              isfingerprintEnable = true;
            } else {
              AuthController.i.updateIsloading(true);
              await AuthRepo.login(username, userpassword, "devicetoken");
              AuthController.i.updateIsloading(false);
            }
          }
        }
      }
    }
  }

  List<BiometricType> _availableBiometrics = [];
  getauth() async {
    _availableBiometrics = await auth.getAvailableBiometrics();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (cnt) {
      return BlurryModalProgressHUD(
        inAsyncCall: AuthController.i.isloginbutton,
        blurEffectIntensity: 4,
        progressIndicator: const SpinKitSpinningLines(
          color: ColorManager.kPrimaryColor,
          size: 60,
        ),
        dismissible: false,
        opacity: 0.4,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
              key: _formKey,
              child: SafeArea(
                  child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                    child: SizedBox(
                      height: Get.height,
                      width: Get.width,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            SizedBox(
                              child: Center(
                                child: Image.asset(
                                  Images.logo,
                                  height: Get.height * 0.06,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.07,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    "login".tr,
                                    style: GoogleFonts.poppins(
                                      textStyle: GoogleFonts.poppins(
                                          fontSize: 30,
                                          color: ColorManager.kOrangeColor,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.04,
                                ),
                                Center(
                                  child: SizedBox(
                                    width: Get.width * 0.55,
                                    child: Text(
                                      "enteryouruser".tr,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        textStyle: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: ColorManager.kblackColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: Get.height * 0.04,
                                ),
                                AuthTextField(
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      return 'enterusername'.tr;
                                    }
                                    return null;
                                  },
                                  maxLines: 1,
                                  controller: cnt.emailController,
                                  hintText: 'username'.tr,
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => ForgotUsername());
                                      },
                                      child: Text(
                                        'forgetuser'.tr,
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: ColorManager.klightblack,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * 0.03,
                                ),
                                AuthTextField(
                                  maxLines: 1,
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      return 'enterpassword'.tr;
                                    }
                                    return null;
                                  },
                                  obscureText: cnt.obsecure,
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        cnt.updateobsecurepassword(
                                            !cnt.obsecure);
                                      },
                                      child: cnt.obsecure
                                          ? const Icon(CupertinoIcons.eye_slash)
                                          : const Icon(CupertinoIcons.eye)),
                                  controller: cnt.passwordController,
                                  hintText: 'password'.tr,
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => ForgetPassword());
                                      },
                                      child: Text(
                                        'forgetpass'.tr,
                                        style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: ColorManager.klightblack,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Get.height * 0.05,
                                ),
                                PrimaryButton(
                                    title: 'login'.tr,
                                    fontSize: 15,
                                    fontweight: FontWeight.bold,
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        FocusScope.of(context).unfocus();
                                        try {
                                          AuthController.i
                                              .updateisloginbuttion(true);
                                          await Prefs().setusername(
                                              AuthController
                                                  .i.emailController.text);
                                          await Prefs().setpassword(
                                              AuthController
                                                  .i.passwordController.text);
                                          AuthController.i.getlogininformation(
                                            cnt.emailController.text,
                                            cnt.passwordController.text,
                                          );
                                          AuthController.i
                                              .updateisloginbuttion(false);
                                        } catch (e) {
                                          AuthController.i
                                              .updateisloginbuttion(false);
                                          log("$e");
                                          Showtoaster().classtoaster(
                                              e.toString(),
                                              ColorManager.kRedColor);
                                        }
                                      }
                                    },
                                    color: ColorManager.kPrimaryColor,
                                    textcolor: ColorManager.kWhiteColor),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                Visibility(
                                  visible: cnt.fingerprint,
                                  child: SizedBox(
                                    height: Get.height * 0.08,
                                    child: Center(
                                        child: InkWell(
                                      onTap: () {
                                        call();
                                      },
                                      child: Platform.isIOS &&
                                              _availableBiometrics
                                                  .contains(BiometricType.face)
                                          ? Image.asset(
                                              Images.facelogin,
                                              height: Get.height * 0.07,
                                            )
                                          : Image.asset(
                                              Images.fingerprinticon,
                                              height: Get.height * 0.07,
                                            ),
                                    )),
                                  ),
                                ),
                                // SizedBox(
                                //   height: Get.height * 0.02,
                                // ),
                                // Visibility(
                                //   visible: isfingerprintEnable,
                                //   child: SizedBox(
                                //     height: Get.height * 0.08,
                                //     child: Center(
                                //         child: InkWell(
                                //       onTap: () {
                                //         call();
                                //       },
                                //       child: Image.asset(Images.fingerprint_icon),
                                //     )),
                                //   ),
                                // ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.08,
                            ),
                            SignupOrLoginText(
                              pre: 'needhelp'.tr,
                              suffix: 'helpcenter'.tr,
                              onTap: () {
                                //Get.to(() => const RegisterScreens());
                                launchWhatsApp();
                                // Get.to(NoDataFound());
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            )),
      );
    });
  }
}

class SignupOrLoginText extends StatelessWidget {
  final Function()? onTap;
  final String? pre;
  final String? suffix;
  const SignupOrLoginText({
    super.key,
    this.pre,
    this.suffix,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$pre',
          //  style: Theme.of(context).textTheme.bodyMedium,
          style: GoogleFonts.poppins(
              fontSize: 15, color: ColorManager.kblackColor),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            '$suffix',
            // style: Theme.of(context)
            //     .textTheme
            //     .bodySmall!
            //     .copyWith(color: ColorManager.kPrimaryColor),
            style: GoogleFonts.poppins(
                fontSize: 15,
                color: ColorManager.kOrangeColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class AuthTextField extends StatelessWidget {
  final bool? obscureText;
  final List<TextInputFormatter>? formatters;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final String? hintText;
  final bool? readOnly;
  final Widget? label;
  final int? maxLines;
  final ValueChanged<String>? onChangedwidget;
  final Color? bordercolor;

  const AuthTextField({
    super.key,
    this.hintText,
    this.onChangedwidget,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.readOnly,
    this.formatters,
    this.obscureText,
    this.label,
    this.maxLines,
    this.bordercolor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 12,
        color: ColorManager.kGreyColor,
      ),
      onChanged: onChangedwidget,
      obscureText: obscureText ?? false,
      inputFormatters: formatters,
      readOnly: readOnly ?? false,
      validator: validator,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        label: label,
        errorStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: ColorManager.kRedColor, fontSize: 12),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        hintText: hintText,
        hintStyle:
            GoogleFonts.poppins(color: ColorManager.kGreyColor, fontSize: 12),
        disabledBorder: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.kRedColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: bordercolor ?? ColorManager.kGreyColor)),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: bordercolor ?? ColorManager.kGreyColor),
        ),
      ),
    );
  }
}

launchWhatsApp() async {
  const contact = "+923418495820";
  const androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
  const iosUrl = "https://wa.me/$contact?text=Hi,%20I%20need%20some%20help";
  try {
    if (Platform.isIOS) {
      await launchUrl(Uri.parse(iosUrl));
    } else {
      await launchUrl(Uri.parse(androidUrl));
    }
  } catch (e) {
    Showtoaster().classtoaster(
        "Whatsapp Not installed in this device", ColorManager.kRedColor);
  }
}
