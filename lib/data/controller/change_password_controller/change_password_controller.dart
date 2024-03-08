import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_emedicare/data/repositories/change_password_repo/change_pass_repo.dart';

class ChangePassController extends GetxController implements GetxService {
  static ChangePassController get i => Get.put(ChangePassController());

  TextEditingController oldpasswordController = TextEditingController();
  TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController newcomfirmpassController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    oldpasswordController = TextEditingController();
    newpasswordcontroller = TextEditingController();
    newcomfirmpassController = TextEditingController();
  }

  bool newpassword = true;
  bool newconfirmpassword = true;
  bool oldpassword = true;

  updatenewpassword(bool ob) {
    newpassword = !newpassword;
    update();
  }

  updatenewconfirmpassword(bool ob) {
    newconfirmpassword = !newconfirmpassword;
    update();
  }

  updateoldpassword(bool ob) {
    oldpassword = !oldpassword;
    update();
  }

  updatepassword() async {
    await ChangePassRepo.changepassword();
  }

  void clear() {
    oldpasswordController.clear();
    newcomfirmpassController.clear();
    newpasswordcontroller.clear();
  }
}
