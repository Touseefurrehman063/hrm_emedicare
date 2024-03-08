import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hrm_emedicare/data/repositories/edit_profile_repo/edit_profile_repo.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:hrm_emedicare/models/get_country_model/getcountrymodel.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfileController extends GetxController implements GetxService {
  static EditProfileController get i => Get.put(EditProfileController());
  TextEditingController nameController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  File? file;
  Future<File?> pickImage({
    bool allowMultiple = false,
    BuildContext? context,
  }) async {
    try {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.image, allowMultiple: allowMultiple);
      if (result != null) {
        file = File(result.files.first.path!);
        update();
      }
    } catch (e) {
      bool permissioncheck = await Permission.storage.isGranted;
      if (!permissioncheck) {
        Fluttertoast.showToast(
            msg: 'PleasegivestoragePermissiontoapplication'.tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorManager.kRedColor,
            textColor: ColorManager.kWhiteColor,
            fontSize: 14.0);
      } else {
        Fluttertoast.showToast(
            msg: 'somethingwentwrong'.tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorManager.kRedColor,
            textColor: ColorManager.kWhiteColor,
            fontSize: 14.0);
      }
    }
    update();
    return file;
  }

  Future<DateTime> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1990, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      return selectedDate;
    }
    return DateTime.now();
  }

  DateTime selectedDate = DateTime.now();
  updateselecteddate(dob) {
    selectedDate = dob;
    update();
  }

  formattedDate(String format) {
    try {
      DateTime dateOfBirth = DateTime.parse(format);

      String formattedDate = DateFormat('dd-MMM-yyyy').format(dateOfBirth);

      return formattedDate;
    } catch (e) {
      return format;
    }
  }

  List<Data>? country;
  updatecountry(selectedcountry) {
    country = selectedcountry;
    update();
  }

  Data? selectcountry;
  updatecountryobject(Data lt) {
    selectcountry = lt;
    update();
  }

  getcountry() async {
    List<Data>? lt;
    lt = await EditProfileRepo.getcountry();
    updatecountry(lt);

    update();
  }

  getfile() async {
    await EditProfileRepo.uploadfile();
    update();
  }

  updateprofile() async {
    await EditProfileRepo.updateprofile();
  }

  @override
  void onInit() {
    super.onInit();
    // fetchCountries();
    nameController = TextEditingController();
    mobilenumberController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
  }

  void clear() {
    nameController.clear();
    mobilenumberController.clear();
    emailController.clear();
    addressController.clear();
    file = null;
  }
}
