import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/components/customtextfield/customtextfield.dart';
import 'package:hrm_emedicare/components/primary_button.dart';
import 'package:hrm_emedicare/components/searchable_dropdown.dart';
import 'package:hrm_emedicare/data/controller/auth_controller/auth_controller.dart';
import 'package:hrm_emedicare/data/controller/edit_profile_controller/edit_profile_controller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:hrm_emedicare/utils/constants/constants.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  static final _formKey = GlobalKey<FormState>();

  static bool checkval = true;
  @override
  Widget build(BuildContext context) {
    var editProfileController = Get.put(EditProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: ColorManager.kblackColor,
          ),
        ),
        title: Text(
          "editProfile".tr,
          style: GoogleFonts.poppins(
              fontSize: 20,
              color: ColorManager.kOrangeColor,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorManager.kWhiteColor,
      ),
      body: GetBuilder<EditProfileController>(builder: (cont) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.05,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      editProfileController.pickImage();
                    },
                    child: Container(
                      height: Get.height * 0.12,
                      width: Get.width * 0.25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: EditProfileController.i.file != null
                              ? DecorationImage(
                                  image:
                                      FileImage(EditProfileController.i.file!))
                              : AuthController.i.userProfile?.picturePath !=
                                      null
                                  ? DecorationImage(
                                      image: NetworkImage(baseURL +
                                          AuthController
                                              .i.userProfile?.picturePath),
                                      fit: BoxFit.cover)
                                  : const DecorationImage(
                                      image: AssetImage(Images.user))),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: ColorManager.kPrimaryColor,
                            child: IconButton(
                                onPressed: () async {
                                  await editProfileController.pickImage();
                                },
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 15,
                                  color: ColorManager.kWhiteColor,
                                )),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Column(
                    children: [
                      EditTextField(
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return 'pleaseenteryourname'.tr;
                          }
                          return null;
                        },
                        maxLines: 1,
                        controller: editProfileController.nameController,
                        hintText: 'fullname'.tr,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      EditTextField(
                        validator: (value) {
                          if (cont.selectedDate.toString().isEmpty) {
                            return "pleaseselectdob".tr;
                          }
                          return null;
                        },
                        onTap: () async {
                          final dob = await cont.selectDate(context);
                          cont.updateselecteddate(dob);
                        },
                        maxLines: 1,
                        hintText:
                            cont.formattedDate(cont.selectedDate.toString()) ??
                                "dob".tr,
                        readOnly: true,
                      ),
                      // EditProfileCustomTextField(
                      //     onTap: () {
                      //       // EditProfileController.i.selectDateAndTime(context,
                      //       //     EditProfileController.arrival, edit.formatearrival);
                      //     },
                      //     readonly: true,
                      //     // hintText: EditProfileController.i.formatearrival.toString(),
                      //     hintText: "DateofBirth".tr),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      EditTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'pleaseenteryourcontactno'.tr;
                          }
                          return null;
                        },
                        maxLines: 1,
                        controller:
                            editProfileController.mobilenumberController,
                        hintText: 'mobilenumber'.tr,
                        keyboardtype: TextInputType.phone,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      EditTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'pleaseenteryouremail'.tr;
                          }
                          return null;
                        },
                        maxLines: 1,
                        controller: editProfileController.emailController,
                        hintText: 'email'.tr,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: checkval
                                  ? OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: ColorManager.kgreencolorstatus,
                                        width: 0.8,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    )
                                  : OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: ColorManager.kgreencolorstatus,
                                        width: 0.8,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              // hintText: cont.selecteddepartment?.name ??
                              hintText:
                                  cont.selectcountry?.name ?? "country".tr,
                              hintStyle: const TextStyle(color: Colors.black),
                              suffixIcon: const Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                // color: selectedGender != null
                                //     ? Colors.black
                                //     : Colors.black,
                              )),
                          readOnly: true,
                          onTap: () async {
                            await cont.getcountry();
                            log(jsonEncode(cont.country));
                            // ignore: use_build_context_synchronously
                            dynamic generic = await searchableDropdown(
                                context, cont.country ?? []);
                            if (generic != null && generic.name != '') {
                              cont.updatecountryobject(generic);
                            }
                          },
                          style: const TextStyle(
                              fontSize: 12, color: ColorManager.kblackColor),
                          validator: (value) {
                            if (cont.selectcountry == null) {
                              return "pleaseselectcountry".tr;
                            }
                            return null;
                          },
                          onChanged: (value) {
                            // Handle the onChanged event if needed
                          },
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      EditTextField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'pleaseenteryouraddress'.tr;
                          }
                          return null;
                        },
                        maxLines: 1,
                        controller: editProfileController.addressController,
                        hintText: 'addresss'.tr,
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.08),
                  PrimaryButton(
                      radius: 25,
                      title: 'update'.tr,
                      fontSize: 15,
                      fontweight: FontWeight.bold,
                      onPressed: () async {
                        // Get.offAll(const DrawerScreen());
                        if (_formKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          try {
                            cont.updateprofile();
                          } catch (e) {
                            log("$e");
                          }
                        }
                        //   FocusScope.of(context).unfocus();

                        //   // try {
                        //   //   await AuthRepo.login(
                        //   //       cnic: login.emailController.text,
                        //   //       password:
                        //   //           login.passwordController.text);
                        //   // } catch (e) {}
                        // }
                      },
                      color: ColorManager.kOrangeColor,
                      textcolor: ColorManager.kWhiteColor),
                  SizedBox(height: Get.height * 0.03),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
