import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:hrm_emedicare/helper/routerclass/myrouter.dart';
import 'package:hrm_emedicare/utils/class_toaster.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Customnavbar extends StatelessWidget {
  int? index;
  Customnavbar({super.key, this.index});
  launchWhatsApp() async {
    const contact = "+923418495820";
    const androidUrl =
        "whatsapp://send?phone=$contact&text=Hi, I need some help";
    const iosUrl = "https://wa.me/$contact?text=Hi,%20I%20need%20some%20help";
    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl),
            mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(Uri.parse(androidUrl),
            mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      Showtoaster().classtoaster(
          "Whatsapp Not installed in this device", ColorManager.kRedColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.09,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              offset: Offset(0, -3),
              color: Colors.grey,
              // spreadRadius: 0.3,
              blurRadius: 2),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Get.height * 0.03),
          topRight: Radius.circular(Get.height * 0.03),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        InkWell(
          onTap: () {
            Get.offAndToNamed(
              Myrouting.home,
            );
          },
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            height: Get.width * 0.16,
            child: Column(
              children: [
                Card(
                  color: index == 0
                      ? ColorManager.kbackgroundcolor
                      : ColorManager.kWhiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.asset(
                      Images.home,
                      height: Get.width * 0.07,
                      color: index == 0
                          ? ColorManager.kWhiteColor
                          : ColorManager.kblackColor,
                    ),
                  ),
                ),
                const Text(
                  "Home",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.offNamed(Myrouting.profile);
          },
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            height: Get.width * 0.16,
            child: Column(
              children: [
                Card(
                  color: index == 1
                      ? ColorManager.kbackgroundcolor
                      : ColorManager.kWhiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.asset(
                      Images.profile,
                      height: Get.width * 0.07,
                      color: index == 1
                          ? ColorManager.kWhiteColor
                          : ColorManager.kblackColor,
                    ),
                  ),
                ),
                const Text(
                  "Profile",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.offNamed(Myrouting.attendence);
          },
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            height: Get.width * 0.16,
            child: Column(
              children: [
                Card(
                  color: index == 2
                      ? ColorManager.kbackgroundcolor
                      : ColorManager.kWhiteColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.asset(
                      Images.biometric,
                      height: Get.width * 0.07,
                      color: index == 2
                          ? ColorManager.kWhiteColor
                          : ColorManager.kblackColor,
                    ),
                  ),
                ),
                const Text(
                  "Attendance",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            launchWhatsApp();
          },
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            height: Get.width * 0.16,
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.asset(
                      Images.help,
                      height: Get.width * 0.07,
                    ),
                  ),
                ),
                const Text(
                  "Help",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
