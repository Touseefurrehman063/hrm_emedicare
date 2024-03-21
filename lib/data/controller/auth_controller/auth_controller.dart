import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hrm_emedicare/View/Dashboard/drawer.dart';
import 'package:hrm_emedicare/View/auth_screen/login.dart';
import 'package:hrm_emedicare/data/localdb/localdb.dart';
import 'package:hrm_emedicare/data/repositories/auth_repository/auth_repo.dart';
import 'package:hrm_emedicare/data/repositories/leave_repository/leave_repository.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:hrm_emedicare/models/department_model/department_model.dart';
import 'package:hrm_emedicare/models/logof/logout.dart';
import 'package:hrm_emedicare/models/usermodel/usermodel.dart';
import 'package:hrm_emedicare/models/userprofile/user_profile_model.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class AuthController extends GetxController implements GetxService {
  static AuthController get i => Get.put(AuthController());
  bool isloginbutton = false;
  updateisloginbuttion(bool val) {
    isloginbutton = val;
    update();
  }

  bool islogoutbutton = false;
  updateislogoutbuttion(bool val) {
    islogoutbutton = val;
    update();
  }

  bool obsecure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController expenseController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController? titleController;
  TextEditingController? descripController;
  TextEditingController? fromcontroller;
  TextEditingController? tocontroller;
  String fromAddress = '';
  String toAddress = '';

  updateobsecurepassword(bool ob) {
    obsecure = !obsecure;
    update();
  }

  UserModel? user;
  updateuser(UserModel s) {
    user = s;
    update;
  }

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

  List<SubDepartment>? department;
  // updatdepartment(DepartmentModel d) {
  //   department = d;
  //   update();
  // }

  getdepaartment(userid) async {
    department = await LeaveRepository.getdepartment();
    update();
  }

  SubDepartment? selecteddepartment;
  updatesubdepartment(selectdepart) {
    selecteddepartment = selectdepart;
    update();
  }

  getlogininformation(username, pass) async {
    user = await AuthRepo.login(
      username,
      pass,
    );
    if (user?.id != null) {
      AuthController.i.emailController.clear();
      AuthController.i.passwordController.clear();
      update();
      Get.offAll(const DrawerScreen());
    }
    update();
  }

  LogoutModel? logof;
  logout() async {
    logof = await AuthRepo.logout();
    if (logof?.status == 1) {
      Prefs().setuser("");
      Prefs().saveUserId("");
      Get.offAll(Login());
    }
    update();
  }

  void updateAddresses() {
    fromAddress = fromcontroller?.text ?? "";
    toAddress = tocontroller?.text ?? "";
    update();
  }

  UserProfile? userProfile;
  updateuserprofile(UserProfile u) {
    userProfile = u;
    update;
  }

  getuserprofile() async {
    String? userid = await Prefs().getUserId();
    userProfile = await AuthRepo.userdetail(userid ?? "");
    update();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  updateIsloading(bool value) {
    _isLoading = value;
    update();
  }

  bool fingerprint = false;
  updatefingerprint(val) {
    fingerprint = val;
    update();
  }

  void clearvalues() {
    fromcontroller?.clear();
    tocontroller?.clear();
    fromAddress = "";
    toAddress = "";
    update();
  }

  formattedDate(String format) {
    try {
      DateTime dateOfBirth = DateTime.parse(format);

      String formattedDate = DateFormat('dd-MM-yyyy').format(dateOfBirth);

      return formattedDate;
    } catch (e) {
      return format;
    }
  }

  @override
  void onInit() {
    titleController = TextEditingController(text: " ");
    descripController = TextEditingController(text: " ");
    fromcontroller = TextEditingController(text: " ");
    tocontroller = TextEditingController(text: " ");

    super.onInit();
  }

  @override
  void dispose() {
    clearvalues();

    super.dispose();
  }
}
