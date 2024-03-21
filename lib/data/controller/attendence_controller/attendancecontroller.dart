import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_emedicare/data/repositories/attendence_repository/attendence_repsoitory.dart';
import 'package:hrm_emedicare/models/today_attendence_model/today_attendence_model.dart';
import 'package:intl/intl.dart';

class Attendancecontroller extends GetxController {
  bool isattendanceLoading = false;
  updateisattendanceLoading(bool val) {
    isattendanceLoading = val;
    update();
  }

  final dateFormatalert = DateFormat('yyyy-MM-dd');
  DateTime dateTimealert = DateTime.now().subtract(const Duration(days: 30));
  DateTime dateTime2alert = DateTime.now();
  UpdatedateTimealert(DateTime dt) {
    dateTimealert = dt;
    update();
  }

  UpdatedateTimealert2(DateTime dt) {
    dateTime2alert = dt;
    update();
  }

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

  TodayAttendenceModel? todayattendence;
  updatetodayattendence(TodayAttendenceModel t) {
    todayattendence = t;
    update;
  }

  gettodayattendence() async {
    todayattendence = await AttendanceRepo.todayattendence();
    update();
  }

  String formatDuration(String? duration) {
    if (duration == null) {
      return '';
    }

    String hours = duration.split(':')[0];
    String minutes = duration.split(':')[1];

    return '$hours h $minutes m';
  }

  static Attendancecontroller get i => Get.put(Attendancecontroller());
}
