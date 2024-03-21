import 'dart:convert';
import 'dart:developer';
import 'package:hrm_emedicare/data/controller/attendence_controller/attendancecontroller.dart';
import 'package:hrm_emedicare/data/localdb/localdb.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:hrm_emedicare/models/today_attendence_model/today_attendence_model.dart';
import 'package:hrm_emedicare/utils/class_toaster.dart';
import 'package:hrm_emedicare/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  try {
    return DateFormat('M-d-yyyy').format(date);
  } catch (e) {
    print("Error formatting date: $e");
    return ""; // Handle the error as needed
  }
}

class AttendanceRepo {
  Future<String> submitAttendance(
    attendanceState,
    latitude,
    longitude,
    address,
  ) async {
    String? userid = await Prefs().getUserId();
    print(userid);
    String? employeeno = await Prefs().getEmployeeNo();
    var headers = {
      'Content-Type': 'application/json',
    };
    var body = {
      "EmployeeNumber": employeeno,
      "AttState": attendanceState,
      "UserId": userid,
      "LocationLongitude": latitude,
      "LocationLattitude": longitude,
      "LocationAddress": address
    };

    try {
      var response = await http.post(Uri.parse(AppConstants.submitAttendance),
          body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var status = responseData['Status'];
        var msg = responseData['SuccessMessage'];
        if (status == 1) {
          if (msg == "Attendance Saved Successfully") {
            Showtoaster().classtoaster(
              "Checked In",
              ColorManager.kgreencolorstatus,
            );
            return 'true';
          }
        } else if (status == -5 || status == 0) {
          Showtoaster().classtoaster(
            msg,
            ColorManager.kRedColor,
          );
        } else {
          return 'false';
        }
      }
    } catch (e) {
      Showtoaster().classtoaster(
        "Something went wrong",
        ColorManager.kRedColor,
      );
      return 'false';
    }
    return 'false';
  }

  static todayattendence() async {
    String formattedStartDate =
        Attendancecontroller.i.dateTimealert.toString().substring(0, 10);
    String formattedEndDate =
        Attendancecontroller.i.dateTime2alert.toString().substring(0, 10);
    String? userid = await Prefs().getUserId();
    Attendancecontroller.i.updateisattendanceLoading(true);

    var body = {
      "StartDate": formattedStartDate,
      "EndDate": formattedEndDate,
      "UserId": userid,
      "start": 0,
      "length": 10000
    };
    log(jsonEncode(body));
    var headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(Uri.parse(AppConstants.todayattendence),
          body: jsonEncode(body), headers: headers);
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        TodayAttendenceModel? attendencedata;
        attendencedata = TodayAttendenceModel.fromJson(result);
        Attendancecontroller.i.updatetodayattendence(attendencedata);
        // Showtoaster().classtoaster(result['ErrorMessage']);
        Attendancecontroller.i.updateisattendanceLoading(false);
        return attendencedata;
      } else {
        Attendancecontroller.i.updateisattendanceLoading(false);
        // Showtoaster().classtoaster(result['ErrorMessage']);
        TodayAttendenceModel attendencedata = TodayAttendenceModel();
        return attendencedata;
      }
    } catch (e) {
      Attendancecontroller.i.updateisattendanceLoading(false);
      TodayAttendenceModel? attendencedata;
      return attendencedata;
    }
  }
}
// }
