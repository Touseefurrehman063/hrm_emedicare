import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/View/auth_screen/change_password/change_password.dart';
import 'package:hrm_emedicare/View/edit_profile/edit_profile.dart';
import 'package:hrm_emedicare/View/visit_outside/visit_outside.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/data/controller/auth_controller/auth_controller.dart';
import 'package:hrm_emedicare/data/localdb/localdb.dart';
import 'package:hrm_emedicare/data/repositories/biometric_auth/biometric_auth.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:hrm_emedicare/utils/constants/constants.dart';
import 'package:hrm_emedicare/utils/language_dialogue/language_dialogue.dart';
import 'package:shimmer/shimmer.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    call();
    super.initState();
  }

  String employeeno = "";
  call() async {
    AuthController.i.updatefingerprint(await Prefs.getfingerprint());
    employeeno = await Prefs().getEmployeeNo() ?? "";
  }

  bool isBiometric = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        // height: Get.height ,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorManager.kbackgroundcolor,
              Color(0xffFFC700),
            ],
          ),
        ),
        child: GetBuilder<AuthController>(builder: (cont) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.13,
                  ),
                  // CircleAvatar(
                  //   backgroundColor: Colors.white,
                  //   radius: Get.width * 0.08,
                  //   child: Container(
                  //     decoration: const BoxDecoration(
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: ClipRRect(
                  //         borderRadius: BorderRadius.circular(50),
                  //         child: AuthController.i.userProfile?.picturePath !=
                  //                 null
                  //             ? Image.network(
                  //                 baseURL +
                  //                     AuthController
                  //                         .i.userProfile?.picturePath,
                  //                 height: Get.height * 0.18,
                  //                 fit: BoxFit.fill,
                  //               )
                  //             : Image.asset(
                  //                 Images.temppicture,
                  //                 height: Get.height * 0.15,
                  //               )),
                  //   ),
                  // ),
                  Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: AuthController.i.userProfile?.picturePath != null
                            ? Image.network(
                                baseURL +
                                    AuthController.i.userProfile?.picturePath,
                                height: Get.height * 0.07,
                                width: Get.width * 0.15,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                Images.temppicture,
                                height: Get.height * 0.07,
                              )),
                  ),
                  SizedBox(
                    height: Get.height * 0.015,
                  ),
                  SizedBox(
                    width: Get.width * 0.65,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AuthController.i.userProfile?.userName ?? "",
                          style: GoogleFonts.poppins(
                              color: ColorManager.kWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const EditProfile());
                          },
                          child: Image.asset(
                            Images.editprofile,
                            height: Get.height * 0.035,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: Get.height * 0.002,
                    color: ColorManager.kWhiteColor,
                  ),
                  SizedBox(
                    width: Get.width * 0.65,
                    child: RichText(
                      text: TextSpan(
                        text: 'empNo'.tr,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.kWhiteColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            // text: AuthController.i.user?.employeeNumber ?? "",
                            text: employeeno,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: ColorManager.kWhiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  ListTile(
                    visualDensity:
                        const VisualDensity(horizontal: 0, vertical: -4),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    leading: Image.asset(
                      Images.visit,
                      height: Get.height * 0.035,
                    ),
                    title: Text(
                      'visitoutside'.tr,
                      style: GoogleFonts.poppins(
                        textStyle: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.kWhiteColor,
                        ),
                      ),
                    ),
                    onTap: () async {
                      Get.to(VisitOustside());
                    },
                  ),
                  ListTile(
                    visualDensity:
                        const VisualDensity(horizontal: 0, vertical: -4),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    leading: Image.asset(
                      Images.lock,
                      height: Get.height * 0.035,
                    ),
                    title: Text(
                      "changepassword".tr,
                      style: GoogleFonts.poppins(
                        textStyle: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.kWhiteColor,
                        ),
                      ),
                    ),
                    onTap: () async {
                      Get.to(const ChangePassword());
                    },
                  ),
                  GetBuilder<AuthController>(builder: (context) {
                    return ListTile(
                      visualDensity:
                          const VisualDensity(horizontal: 0, vertical: -4),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0),
                      leading: Image.asset(
                        Images.biometric,
                        height: Get.height * 0.035,
                        color: ColorManager.kWhiteColor,
                      ),
                      trailing: Transform.scale(
                        scale: 0.55,
                        child: Switch.adaptive(
                            trackOutlineColor:
                                MaterialStateProperty.resolveWith(
                              (final Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return ColorManager.kWhiteColor;
                                }

                                return ColorManager.kWhiteColor;
                              },
                            ),
                            thumbColor:
                                MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return ColorManager.kWhiteColor;
                              }
                              return ColorManager.kWhiteColor;
                            }),
                            activeTrackColor:
                                ColorManager.kWhiteColor.withOpacity(0),
                            inactiveTrackColor:
                                ColorManager.kWhiteColor.withOpacity(0),
                            value: AuthController.i.fingerprint,
                            onChanged: (val) async {
                              bool auth = await Authentication.authentication();
                              if (val == true) {
                                if (auth) {
                                  if (auth) {
                                    if (AuthController.i.userProfile?.id ==
                                        null) {
                                      AuthController.i.updatefingerprint(auth);
                                    } else {
                                      Prefs.savefingerprint(true);
                                      AuthController.i.updatefingerprint(true);
                                    }
                                  } else {}
                                  if (AuthController.i.fingerprint) {
                                    if (auth) {
                                      if (AuthController.i.userProfile?.id !=
                                          null) {
                                        Prefs.savefingerprint(true);

                                        AuthController.i
                                            .updatefingerprint(true);
                                      }

                                      AuthController.i.userProfile;
                                    } else {
                                      Prefs.savefingerprint(true);
                                      AuthController.i.updatefingerprint(true);
                                    }
                                  }
                                } else {
                                  Prefs.savefingerprint(false);
                                  AuthController.i.updatefingerprint(false);
                                }
                              } else {
                                Prefs.savefingerprint(false);
                                AuthController.i.updatefingerprint(false);
                              }
                            }),
                      ),
                      title: Text(
                        'biometric'.tr,
                        style: GoogleFonts.poppins(
                          textStyle: GoogleFonts.poppins(
                              fontSize: 15,
                              color: ColorManager.kWhiteColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  }),
                  ListTile(
                    visualDensity:
                        const VisualDensity(horizontal: 0, vertical: -4),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    leading: Image.asset(
                      Images.language,
                      height: Get.height * 0.035,
                    ),
                    title: Text(
                      'languages'.tr,
                      style: GoogleFonts.poppins(
                        textStyle: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: ColorManager.kWhiteColor,
                        ),
                      ),
                    ),
                    onTap: () async {
                      await languageSelector(context, AppConstants.languages);
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Divider(
                    thickness: Get.height * 0.002,
                    color: ColorManager.kWhiteColor,
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  SizedBox(
                    width: Get.width * 0.65,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: Get.context!,
                            builder: (context) {
                              return StatefulBuilder(
                                  builder: (context, setstate) {
                                return Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body: Material(
                                    color: Colors.transparent,
                                    child: AlertDialog(
                                      scrollable: true,
                                      title: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Text(
                                              'privacyPolicy'.tr,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color: ColorManager
                                                          .kblackColor,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w900),
                                            ),
                                            const Divider(
                                              color: ColorManager.kblackColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                      backgroundColor: Colors.white,
                                      content: SizedBox(
                                        width: Get.width,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: Get.height * 0.6,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'consentTitle'.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              color: ColorManager
                                                                  .kblackColor,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                    ),
                                                    Text(
                                                      'consent'.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              fontSize: 12,
                                                              color: ColorManager
                                                                  .kblackColor),
                                                    ),
                                                    Text(
                                                      'informationWeCollect'.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              fontSize: 13,
                                                              color: ColorManager
                                                                  .kblackColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.01,
                                                    ),
                                                    Text(
                                                      'information1'.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              fontSize: 12,
                                                              color: ColorManager
                                                                  .kblackColor),
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    Text(
                                                      'information2'.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              fontSize: 12,
                                                              color: ColorManager
                                                                  .kblackColor),
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    Text(
                                                      'usageTitle'.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              fontSize: 13,
                                                              color: ColorManager
                                                                  .kblackColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    Text(
                                                      'usage'.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              fontSize: 12,
                                                              color: ColorManager
                                                                  .kblackColor),
                                                    ),
                                                    Text(
                                                      'disclosureTitle'.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              fontSize: 13,
                                                              color: ColorManager
                                                                  .kblackColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                    ),
                                                    Text(
                                                      'disclosure'.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              fontSize: 12,
                                                              color: ColorManager
                                                                  .kblackColor),
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          children: <InlineSpan>[
                                                            WidgetSpan(
                                                              child: SizedBox(
                                                                  width:
                                                                      Get.width *
                                                                          0.01),
                                                            ),
                                                          ],
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .titleMedium
                                                              ?.copyWith(
                                                                  color: ColorManager
                                                                      .kblackColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              ColorManager
                                                                  .kOrangeColor,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10))),
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: const Text("Ok")),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                            });
                      },
                      child: Text(
                        "privacyPolicy".tr,
                        style: GoogleFonts.sora(
                          color: ColorManager.kWhiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  SizedBox(
                    width: Get.width * 0.65,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: Get.context!,
                            builder: (context) {
                              return StatefulBuilder(
                                  builder: (context, setstate) {
                                return Scaffold(
                                  backgroundColor: Colors.transparent,
                                  body: Material(
                                    color: Colors.transparent,
                                    child: AlertDialog(
                                      scrollable: true,
                                      title: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'termsAndConditions'.tr,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: ColorManager
                                                        .kblackColor,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w900),
                                          ),
                                          const Divider(
                                            color: ColorManager.kblackColor,
                                          ),
                                        ],
                                      ),
                                      backgroundColor: Colors.white,
                                      content: SizedBox(
                                        width: Get.width,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: Get.height * 0.6,
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'termsofuse'.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              color: ColorManager
                                                                  .kblackColor,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    Text(
                                                      'link'.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              fontSize: 12,
                                                              color: ColorManager
                                                                  .kblackColor),
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    Text(
                                                      'access'.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              fontSize: 13,
                                                              color: ColorManager
                                                                  .kblackColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.01,
                                                    ),
                                                    Text(
                                                      'accessinformation'.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              fontSize: 12,
                                                              color: ColorManager
                                                                  .kblackColor),
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    Text(
                                                      'disclaimertitle'.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              fontSize: 13,
                                                              color: ColorManager
                                                                  .kblackColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    Text(
                                                      'disclaimer1'.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              fontSize: 12,
                                                              color: ColorManager
                                                                  .kblackColor),
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    Text(
                                                      'contactinfo'.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              fontSize: 13,
                                                              color: ColorManager
                                                                  .kblackColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w900),
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    Text(
                                                      'contactinfodetail'.tr,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              fontSize: 12,
                                                              color: ColorManager
                                                                  .kblackColor),
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                          children: <InlineSpan>[
                                                            WidgetSpan(
                                                              child: SizedBox(
                                                                  width:
                                                                      Get.width *
                                                                          0.01),
                                                            ),
                                                          ],
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .titleMedium
                                                              ?.copyWith(
                                                                  color: ColorManager
                                                                      .kblackColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              ColorManager
                                                                  .kOrangeColor,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10))),
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: const Text(
                                                        "Ok",
                                                      )),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                            });
                      },
                      child: Text(
                        "termsAndConditions".tr,
                        style: GoogleFonts.sora(
                          color: ColorManager.kWhiteColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.22,
                  ),
                  ListTile(
                    leading: Image.asset(
                      Images.logout,
                      height: Get.height * 0.035,
                    ),
                    visualDensity:
                        const VisualDensity(horizontal: 0, vertical: -4),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    title: AuthController.i.islogoutbutton
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade900,
                            enabled: AuthController.i.islogoutbutton,
                            child: Text(
                              'logout'.tr,
                              style: GoogleFonts.poppins(
                                textStyle: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: ColorManager.kWhiteColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        : Text(
                            'logout'.tr,
                            style: GoogleFonts.poppins(
                              textStyle: GoogleFonts.poppins(
                                fontSize: 15,
                                color: ColorManager.kWhiteColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                    onTap: () async {
                      AuthController.i.updateislogoutbuttion(true);
                      try {
                        await AuthController.i.logout();
                        AuthController.i.updateislogoutbuttion(false);
                      } catch (e) {
                        AuthController.i.updateislogoutbuttion(false);
                      }
                    },
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  customListTile(BuildContext context,
      {String? title,
      Function()? onTap,
      Color? textColor = ColorManager.kWhiteColor,
      String? imagePath,
      bool? togglebutton = false,
      bool? isIcon = false,
      bool isImageThere = false}) {
    return ListTile(
        onTap: onTap,
        minLeadingWidth: 20,
        contentPadding: EdgeInsets.zero,
        leading: isIcon == false
            ? Image.asset(imagePath!)
            : const Icon(
                Icons.delete,
                color: ColorManager.kRedColor,
                size: 20,
              ),
        title: Text(
          '$title',
          style:
              Theme.of(context).textTheme.bodySmall?.copyWith(color: textColor),
        ),
        trailing: togglebutton == true
            ? CupertinoSwitch(value: true, onChanged: (value) {})
            : const SizedBox.shrink());
  }
}

Future<String?> deleteAccount(context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) =>
        StatefulBuilder(builder: (context, newState) {
      return AlertDialog(
        backgroundColor: ColorManager.kPrimaryColor,
        title: Text('Delete Account'.tr,
            style: GoogleFonts.poppins(
                fontSize: 14, color: ColorManager.kWhiteColor)),
        content: Text('Do you really want to delete account'.tr,
            style: GoogleFonts.poppins(
                fontSize: 12, color: ColorManager.kWhiteColor)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.kWhiteColor),
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: Text(
                      'cancel'.tr,
                      style: GoogleFonts.poppins(
                          color: ColorManager.kPrimaryColor),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.kWhiteColor),
                      onPressed: () async {},
                      child: Text(
                        'Delete'.tr,
                        style: GoogleFonts.poppins(
                            color: ColorManager.kPrimaryColor),
                      )),
                ),
              ],
            ),
          )
        ],
      );
    }),
  );
}
