import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hrm_emedicare/data/repositories/leave_repository/leave_repository.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:hrm_emedicare/models/department_model/department_model.dart';
import 'package:hrm_emedicare/models/leave_status/leave_status.dart';
import 'package:hrm_emedicare/models/leave_type_model/leave_balance_model.dart';
import 'package:hrm_emedicare/models/leave_type_model/leave_type_model.dart';
import 'package:hrm_emedicare/models/line_manager_model/line_manager_model.dart';
import 'package:hrm_emedicare/models/submit_model/submit_model.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class LeaveController extends GetxController {
  bool isLeaveLoading = false;
  updateisLeaveLoading(bool val) {
    isLeaveLoading = val;
    update();
  }

  @override
  void dispose() {
    selectedlinemanagerlist.clear();

    super.dispose();
  }

  bool chk = false;

  updatefinalcheck(bool val) {
    chk = val;
    update();
  }

  LeaveBalanceModel? annual;
  LeaveBalanceModel? casual;
  LeaveBalanceModel? sick;
  LeaveBalanceModel? other;

  updateleaves() async {
    annual =
        await LeaveRepository.leaves("370476a7-bb15-4e62-98a9-8e8a60188eb8");
    sick = await LeaveRepository.leaves("5b544ecb-b3f8-4193-add2-8e0641d52ddd");
    casual =
        await LeaveRepository.leaves("9581d003-5c3e-468e-ac0f-4b142dbab9a3");
    other =
        await LeaveRepository.leaves("c00c54e1-f5ac-4f29-9732-e3e9c071f908");
    update();
  }

  TextEditingController? titleController;
  TextEditingController? descripController;

  int selectedLeaveType = 1;

  BorderRadius dynamicBorder = const BorderRadius.only(
    topLeft: Radius.circular(30),
    bottomLeft: Radius.circular(30),
  );
  BorderRadius rightborder = const BorderRadius.only(
    topRight: Radius.circular(30),
    bottomRight: Radius.circular(30),
  );

  DateTime selectedDate = DateTime.now();
  updateselecteddate(date) {
    selectedDate = date;
    update();
  }

  DateTime selectedDate1 = DateTime.now();
  updateselecteddate1(date1) {
    selectedDate1 = date1;
    update();
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

  Future<DateTime> selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate1,
      firstDate: DateTime(1990, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate1) {
      selectedDate1 = picked;
      return selectedDate1;
    }
    return DateTime.now();
  }

  TimeOfDay selectedTime = TimeOfDay.now();
  updatetime(time) {
    selectedTime = time;
    update();
  }

  Future<TimeOfDay> selectTime(BuildContext context) async {
    final TimeOfDay? pickedS = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedS != null && pickedS != selectedTime) {
      selectedTime = pickedS;
      return selectedTime;
    }
    return TimeOfDay.now();
  }

  TimeOfDay selectedTime1 = TimeOfDay.now();
  updatetime1(time1) {
    selectedTime1 = time1;
    update();
  }

  Future<TimeOfDay> selectTime1(BuildContext context) async {
    final TimeOfDay? pickedS = await showTimePicker(
      context: context,
      initialTime: selectedTime1,
    );

    if (pickedS != null && pickedS != selectedTime1) {
      selectedTime1 = pickedS;
      return selectedTime1;
    }
    return TimeOfDay.now();
  }

  int index = 0;
  updateindex(int i) {
    index = i;
    update();
  }

  List<Leavedata>? leavetype;
  updateleavetype(selectleavetype) {
    leavetype = selectleavetype;
    update();
  }

  Leavedata? selectleavetype;
  updateleavetypeobject(Leavedata lt) {
    selectleavetype = lt;
    update();
  }

  getleavetype() async {
    List<Leavedata>? lt;
    lt = await LeaveRepository.leavetype();
    updateleavetype(lt);

    update();
  }

  updateleave(type) {
    selectedLeaveType = type;
    update();
  }

  List<Linemanagerdata>? linemanagerList;
  updatelinemanager(selectedmanager) {
    linemanagerList = selectedmanager;
    update();
  }

  Linemanagerdata? selectedmanager;
  updatelinemanagerobject(Linemanagerdata lm) {
    selectedmanager = lm;
    update();
  }

  List<Linemanagerdata> selectedlinemanagerlist = [];
  addlinemanager(addlinemanager) {
    selectedlinemanagerlist.add(addlinemanager);
    update();
  }

  deletelinemanager(deletemanager) {
    selectedlinemanagerlist.removeWhere((element) => element == deletemanager);
    update();
  }

  getlinemanager() async {
    List<Linemanagerdata>? lt;
    lt = await LeaveRepository.getLineManagers();
    updatelinemanager(lt);

    update();
  }

  updatemanager(type) {
    selectedmanager = type;
    update();
  }

  SubDepartment? selecteddepartment;
  updatesubdepartment(selectdepart) {
    selecteddepartment = selectdepart;
    update();
  }

  LeaveBalanceModel? leavebalance;
  updateleavebalance(LeaveBalanceModel l) {
    leavebalance = l;
    update;
  }

  getleavebalance() async {
    leavebalance = await LeaveRepository.leavebalance();
    update();
  }

  LeaveStatusModel? leavestatus;
  updateleavestatus(LeaveStatusModel ls) {
    leavestatus = ls;
    update;
  }

  getleavestatus() async {
    try {
      leavestatus = await LeaveRepository.getleavestatus();
      update();
    } catch (e) {}
  }

  SubmitModel? submitleave;
  updatesubmitleave(SubmitModel sm) {
    submitleave = sm;
  }

  getsubmitleave() async {
    submitleave = await LeaveRepository.submitleave();
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

  List<SubDepartment>? department;
  getdepaartment() async {
    department = await LeaveRepository.getdepartment();

    update();
  }

  String formattedTime(TimeOfDay time) {
    final now = DateTime.now();
    final DateTime dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final formattedTime = DateFormat.jm().format(dateTime);
    return formattedTime;
  }

  PlatformFile? pmcfile;
  Future<void> picksinglefile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        pmcfile = result.files.first;
      }
    } catch (e) {
      bool permissioncheck = await Permission.storage.isGranted;
      if (!permissioncheck) {
        Fluttertoast.showToast(
            msg: 'Please Give storage Permission to application',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorManager.kRedColor,
            textColor: ColorManager.kWhiteColor,
            fontSize: 14.0);
      } else {
        Fluttertoast.showToast(
            msg: 'Something went wrong'.tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: ColorManager.kRedColor,
            textColor: ColorManager.kWhiteColor,
            fontSize: 14.0);
      }
    }
  }

  @override
  void onInit() {
    titleController = TextEditingController(text: " ");
    descripController = TextEditingController(text: "\n");

    super.onInit();
  }

  static LeaveController get i => Get.put(LeaveController());
}
