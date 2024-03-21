import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/View/edit_profile/edit_profile.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/components/customnavbar.dart';
import 'package:hrm_emedicare/data/controller/auth_controller/auth_controller.dart';
import 'package:hrm_emedicare/data/localdb/localdb.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:hrm_emedicare/helper/routerclass/myrouter.dart';
import 'package:hrm_emedicare/utils/constants/constants.dart';

class Userprofile extends StatefulWidget {
  const Userprofile({super.key});

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImagePath();
  }

  String? imagepath;
  String username = "";
  String designation = "";
  void getImagePath() async {
    imagepath = await Prefs().getImagePath() ?? "";
    username = await Prefs().getusername() ?? "";
    designation = await Prefs().getUserDesignation() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    // AuthController.i.user?.designations;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xffF58020),
          Color(0xffF6EE31),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Customnavbar(
            index: 1,
          ),
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: Text(
            "profile".tr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: InkWell(
              onTap: () {
                // Get.back();
                Get.offAndToNamed(
                  Myrouting.home,
                );
              },
              child: const Icon(Icons.arrow_back_ios_new)),
        ),
        body: GetBuilder<AuthController>(builder: (cont) {
          return StreamBuilder<Object>(
              stream: Stream.periodic(const Duration(seconds: 2), (i) => i),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    SizedBox(height: Get.height * 0.01),
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: CircleAvatar(
                    //     backgroundColor: Colors.white,
                    //     radius: 60,
                    //     child: Container(
                    //       decoration: const BoxDecoration(
                    //         shape: BoxShape.circle,
                    //       ),
                    //       child: ClipRRect(
                    //           borderRadius: BorderRadius.circular(60),
                    //           child:
                    //               AuthController.i.userProfile?.picturePath !=
                    //                       null
                    //                   ? Image.network(
                    //                       baseURL +
                    //                           AuthController
                    //                               .i.userProfile?.picturePath,
                    //                       height: Get.height * 0.19,
                    //                       fit: BoxFit.fill,
                    //                     )
                    //                   : Image.asset(
                    //                       Images.temppicture,
                    //                       height: Get.height * 0.19,
                    //                     )),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: AuthController.i.userProfile?.picturePath !=
                                  null
                              ? Image.network(
                                  baseURL +
                                      AuthController.i.userProfile?.picturePath,
                                  height: Get.height * 0.14,
                                  width: Get.width * 0.3,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  Images.temppicture,
                                  height: Get.height * 0.07,
                                )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      cont.userProfile?.userName ?? "",
                      style: GoogleFonts.poppins(
                          fontSize: 22.h,
                          color: ColorManager.kWhiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      cont.user?.designations ?? "",
                      style: GoogleFonts.poppins(
                        fontSize: 18.h,
                        color: ColorManager.kWhiteColor,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const EditProfile()));
                      },
                      child: Container(
                        height: Get.height * 0.04,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(06),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            Images.profileedit,
                            fit: BoxFit.fill,
                            colorBlendMode: BlendMode.color,
                            height: Get.height * 0.02,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorManager.kWhiteColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Get.height * 0.04),
                              topRight: Radius.circular(Get.height * 0.04),
                            )),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.02),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Get.height * 0.01),
                                  width: Get.width * 0.93,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: ColorManager.kgreencolorstatus),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "address".tr,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            color: ColorManager.kWhiteColor,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          cont.userProfile?.address ?? "",
                                          style: GoogleFonts.poppins(
                                              color: ColorManager.kWhiteColor,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 30),
                                  width: Get.width * 0.93,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: ColorManager.kbackgroundcolor),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "dob".tr,
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      ColorManager.kWhiteColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.01,
                                            ),
                                            Text(
                                              "${AuthController.i.formattedDate(AuthController.i.userProfile?.dateOfBirth?.split("T")[0] ?? "")}",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      ColorManager.kWhiteColor,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.01,
                                        ),
                                        const VerticalDivider(
                                          width: 15,
                                          thickness: 1.5,
                                          indent: 1,
                                          endIndent: 1,
                                          color: ColorManager.kWhiteColor,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "contactno".tr,
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      ColorManager.kWhiteColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.01,
                                            ),
                                            Text(
                                              cont.userProfile?.cellNumber ??
                                                  "",
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      ColorManager.kWhiteColor,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.01,
                                        ),
                                        const VerticalDivider(
                                          width: 20,
                                          thickness: 1.5,
                                          indent: 1,
                                          endIndent: 1,
                                          color: ColorManager.kWhiteColor,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "nationality".tr,
                                              style: GoogleFonts.poppins(
                                                  color:
                                                      ColorManager.kWhiteColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              height: Get.height * 0.01,
                                            ),
                                            Text(
                                              cont.userProfile?.country ?? "",
                                              style: GoogleFonts.poppins(
                                                color: ColorManager.kWhiteColor,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: Get.height * 0.01),
                                  width: Get.width * 0.93,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: ColorManager.kgreencolorstatus),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          "email".tr,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            color: ColorManager.kWhiteColor,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          cont.userProfile?.email ?? "",
                                          style: GoogleFonts.poppins(
                                              color: ColorManager.kWhiteColor,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
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
                    )
                  ],
                );
              });
        }),
      ),
    );
  }
}
