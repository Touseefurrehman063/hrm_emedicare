// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController implements GetxService {
  static ForgotPasswordController get i => Get.put(ForgotPasswordController());

  late TextEditingController passwordController;
  late TextEditingController comfirmController;

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    comfirmController = TextEditingController();
  }

  bool newpassword = true;
  bool newconfirmpassword = true;

  updatenewpassword(bool ob) {
    newpassword = !newpassword;
    update();
  }

  updatenewconfirmpassword(bool ob) {
    newconfirmpassword = !newconfirmpassword;
    update();
  }

  RxInt timer = 300.obs;
  var isTimerOver = false.obs;
  late Timer countdownTimer;

  void startTimer(context) {
    isTimerOver.value = false;
    const oneSecond = Duration(seconds: 1);
    countdownTimer = Timer.periodic(oneSecond, (tim) {
      if (timer.value == 0) {
        isTimerOver.value = true;
        tim.cancel();

        // showToaster('codeexpire'.tr, ColorManager.kPrimaryColor,
        //       ColorManager.kWhiteColor);
      } else {
        timer--;
      }
    });
  }

  void resetTimerAndUpdate() {
    countdownTimer.cancel();
    timer.value = 300;
    update();
  }

  @override
  void onClose() {
    countdownTimer.cancel();
    super.onClose();
  }
}
