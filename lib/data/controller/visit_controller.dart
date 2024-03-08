import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitController extends GetxController implements GetxService {
  bool obsecure = true;

  late TextEditingController fromcontroller;
  late TextEditingController tocontroller;
  String fromAddress = '';
  String toAddress = '';

  updateobsecurepassword(bool ob) {
    obsecure = !obsecure;
    update();
  }

  void updateAddresses() {
    fromAddress = fromcontroller.text;
    toAddress = tocontroller.text;
    update();
  }

  void clearvalues() {
    fromAddress = "";
    toAddress = "";
    update();
  }

  @override
  void onInit() {
    fromcontroller = TextEditingController(text: " ");
    tocontroller = TextEditingController(text: " ");

    super.onInit();
  }

  @override
  void dispose() {
    clearvalues();

    super.dispose();
  }
}
