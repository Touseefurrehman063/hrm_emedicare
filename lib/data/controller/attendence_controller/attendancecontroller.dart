import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_emedicare/data/repositories/attendence_repository/attendence_repsoitory.dart';
import 'package:hrm_emedicare/models/today_attendence_model/today_attendence_model.dart';

class Attendancecontroller extends GetxController {
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
    String seconds = duration.split(':')[2];

    return '$hours h $minutes m $seconds s';
  }

  static Attendancecontroller get i => Get.put(Attendancecontroller());
}
