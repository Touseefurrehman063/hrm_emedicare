import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitOutsideController extends GetxController {
  int selectedLeaveType = 1;

  BorderRadius dynamicBorder = const BorderRadius.only(
    topLeft: Radius.circular(30),
    bottomLeft: Radius.circular(30),
  );
  BorderRadius rightborder = const BorderRadius.only(
    topRight: Radius.circular(30),
    bottomRight: Radius.circular(30),
  );
  int index = 0;
  updateindex(int i) {
    index = i;
    update();
  }

  updateleave(type) {
    selectedLeaveType = type;
    update();
  }

  static VisitOutsideController get i => Get.put(VisitOutsideController());
}
