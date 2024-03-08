import 'dart:convert';
import 'dart:developer';

import 'package:hrm_emedicare/data/controller/attendence_controller/attendancecontroller.dart';
import 'package:hrm_emedicare/data/controller/auth_controller/auth_controller.dart';
import 'package:hrm_emedicare/models/today_attendence_model/today_attendence_model.dart';
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
  static todayattendence() async {
    DateTime endDate = DateTime.now();
    DateTime startDate = endDate.subtract(const Duration(days: 30));

    String formattedStartDate = formatDate(startDate);
    String formattedEndDate = formatDate(endDate);

    var body = {
      "StartDate": formattedStartDate,
      "EndDate": formattedEndDate,
      "UserId": AuthController.i.userProfile?.id,
      "start": 0,
      "length": 100
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
        return attendencedata;
      } else {
        // Showtoaster().classtoaster(result['ErrorMessage']);
      }
    } catch (e) {
      return e;
    }
  }
}
