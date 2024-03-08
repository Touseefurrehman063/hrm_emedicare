import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:hrm_emedicare/data/controller/edit_profile_controller/edit_profile_controller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:hrm_emedicare/models/get_country_model/getcountrymodel.dart';
import 'package:hrm_emedicare/utils/class_toaster.dart';
import 'package:hrm_emedicare/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

import '../../controller/auth_controller/auth_controller.dart';

class EditProfileRepo {
  static updateprofile() async {
    var body = {
      "UserId": AuthController.i.userProfile?.id,
      "UserName": EditProfileController.i.nameController.text,
      "FirstName": AuthController.i.userProfile?.firstName,
      "DateOfBirth": EditProfileController.i.selectedDate.toString(),
      "PicturePath": await EditProfileRepo.uploadfile(),
      "Country": EditProfileController.i.selectcountry?.name,
      "CountryId": EditProfileController.i.selectcountry?.id,
      "Address": EditProfileController.i.addressController.text,
      "CellNumber": EditProfileController.i.mobilenumberController.text,
      "Email": EditProfileController.i.emailController.text,
    };
    var headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(Uri.parse(AppConstants.updateprofile),
          body: jsonEncode(body), headers: headers);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (result['Status'] == 1) {
          Showtoaster()
              .classtoaster(result['ErrorMessage'], ColorManager.kPrimaryColor);
          EditProfileController.i.clear();
          AuthController.i.getuserprofile();
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

  static Future<String> uploadfile() async {
    String r = '';
    var url = AppConstants.attachfile;
    if (EditProfileController.i.file != null) {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.files.add(await http.MultipartFile.fromPath(
          'image', EditProfileController.i.file?.path ?? ""));

      final res = await request.send();

      if (res.statusCode == 200) {
        dynamic data = jsonDecode(await res.stream.bytesToString());
        r = data["Path"];

        log('Upload success: ');
      } else {
        log('Upload failed with status ${res.statusCode}');
      }
    }

    return r;
  }

  static getcountry() async {
    var body = {};
    var headers = {'Content-Type': 'application/json'};
    log(jsonEncode(body));
    try {
      var response =
          await http.get(Uri.parse(AppConstants.getcountry), headers: headers);
      var result = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Iterable dt = result['Data'];
        List<Data> countrydata = dt.map((e) => Data.fromJson(e)).toList();
        return countrydata;
      } else {}
    } catch (e) {
      log(e.toString());
      return e;
    }
  }
}
