import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:hrm_emedicare/data/controller/auth_controller/auth_controller.dart';
import 'package:hrm_emedicare/data/controller/change_password_controller/change_password_controller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

import 'package:hrm_emedicare/utils/class_toaster.dart';
import 'package:hrm_emedicare/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

class ChangePassRepo {
  static changepassword() async {
    var body = {
      "UserId": AuthController.i.userProfile?.id,
      "OldPassword": ChangePassController.i.oldpasswordController.text,
      "NewPassword": ChangePassController.i.newpasswordcontroller.text,
    };
    var headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(Uri.parse(AppConstants.changepassword),
          body: jsonEncode(body), headers: headers);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (result['Status'] == 1) {
          Showtoaster()
              .classtoaster(result['ErrorMessage'], ColorManager.kPrimaryColor);
          ChangePassController.i.clear();
          Get.close(1);
        } else {
          Showtoaster()
              .classtoaster(result['ErrorMessage'], ColorManager.kRedColor);
        }
      } else {
        Showtoaster()
            .classtoaster(result['ErrorMessage'], ColorManager.kRedColor);
      }
    } catch (e) {
      log("$e");
    }
  }
}
