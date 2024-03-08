import 'dart:ui';

import 'package:get/get_utils/get_utils.dart';
import 'package:hrm_emedicare/models/language_model/language_model.dart';

String baseURL = 'http://hrmapi.e-mcs.org/';
String contactnumber = '';

class AppConstants {
  static const int maximumDataTobeFetched = 25;
  static List<LanguageModel> languages = [
    LanguageModel(name: 'English', id: 1, locale: const Locale('en', 'US')),
    LanguageModel(name: 'اردو'.tr, id: 2, locale: const Locale('ur', 'PK')),
  ];

  static String login = '$baseURL/api/account';
  static String getuserdetail = '$baseURL/api/account/GetUpdateProfileDetail';
  static String todayattendence = '$baseURL/api/account/GetAttendanceHistory';
  static String getdepartment = '$baseURL/api/Leave/GetDepartments';
  static String getSubDepartments = '$baseURL/api/Leave/GetSubDepartments';
  static String leavetype = '$baseURL/api/Leave/LeaveTypes';
  static String leavebalance = '$baseURL/api/Leave/LeaveBalance';
  static String getlinemanager = '$baseURL/api/Leave/GetLineManagers';
  static String logout = '$baseURL/api/account/Logoff';
  static String submitleave = '$baseURL/api/Leave/SubmitLeave';
  static String leaveStatus = '$baseURL/api/Leave/LeaveStatus';
  static String changepassword = '$baseURL/api/account/ChangePassword';
  static String updateprofile = '$baseURL/api/account/UpdateProfile';
  static String getcountry = '$baseURL/api/ddl/GetCountries';
  static String attachfile = '$baseURL/api/Leave/AttachFile';
}
