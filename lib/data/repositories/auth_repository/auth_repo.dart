import 'dart:convert';

import 'package:hrm_emedicare/data/controller/auth_controller/auth_controller.dart';
import 'package:hrm_emedicare/data/localdb/localdb.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:hrm_emedicare/models/logof/logout.dart';
import 'package:hrm_emedicare/models/usermodel/usermodel.dart';
import 'package:hrm_emedicare/models/userprofile/user_profile_model.dart';
import 'package:hrm_emedicare/utils/class_toaster.dart';
import 'package:hrm_emedicare/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  static login(username, password) async {
    String? devicetoken = await Prefs().getDeviceToken();
    var body = {
      'UserName': username,
      'Password': password,
      'IsDependent': "false",
      'DeviceToken': devicetoken,
      'Manufacturer': "Browser",
      'Model': "",
      'AppVersion': "Mobile",
      'DeviceVersion':
          "Mozilla/5.0 (Linux; Android 11; SM-A307FN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.92 Mobile Safari/537.36",
    };
    var headers = {'Content-Type': 'application/json'};

    print(body);
    try {
      var response = await http.post(Uri.parse(AppConstants.login),
          body: jsonEncode(body), headers: headers);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        UserModel? data;

        data = UserModel.fromJson(result);

        // Prefs().init();
        Prefs().setuser(data.id);
        Prefs().saveUserId(data.id);
        Prefs().saveOrganizationId(data.organizationId);
        Prefs().saveImagePath(data.imagePath);
        Prefs().saveUserDesignation(data.userDisplayDesignation);
        Prefs().saveEmployeeNo(data.employeeNumber);
        AuthController.i.updateuser(data);
        AuthController.i.getuserprofile();
        // Showtoaster()
        //     .classtoaster(result['ErrorMessage'], ColorManager.kPrimaryColor);
        return data;
      } else {
        Showtoaster()
            .classtoaster(result['ErrorMessage'], ColorManager.kRedColor);
      }
    } catch (e) {
      return e;
    }
  }

  static userdetail(userid) async {
    var body = {"UserId": userid};
    var headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(Uri.parse(AppConstants.getuserdetail),
          body: jsonEncode(body), headers: headers);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        UserProfile? data;

        data = UserProfile.fromJson(result);

        AuthController.i.updateuserprofile(data);
        // Showtoaster().classtoaster(result['ErrorMessage']);
        return data;
      } else {
        // Showtoaster().classtoaster(result['ErrorMessage']);
      }
    } catch (e) {
      return e;
    }
  }

  static logout() async {
    String? devicetoken = await Prefs().getDeviceToken();
    print(devicetoken);
    String? userid = await Prefs().getUserId();
    var body = {
      "UserId": userid,
      "DeviceToken": devicetoken,
    };
    var headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(Uri.parse(AppConstants.logout),
          body: jsonEncode(body), headers: headers);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        LogoutModel? data;

        data = LogoutModel.fromJson(result);

        // Prefs().init();
        // Prefs().setuser(data.id);

        // Showtoaster()
        //     .classtoaster(result['SuccessMessage'], ColorManager.kPrimaryColor);
        return data;
      } else {
        Showtoaster()
            .classtoaster(result['SuccessMessage'], ColorManager.kRedColor);
      }
    } catch (e) {
      return e;
    }
  }
}
