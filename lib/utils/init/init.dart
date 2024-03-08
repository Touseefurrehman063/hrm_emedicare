import 'package:get/get.dart';
import 'package:hrm_emedicare/data/controller/attendence_controller/attendancecontroller.dart';
import 'package:hrm_emedicare/data/controller/auth_controller/auth_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<Attendancecontroller>(Attendancecontroller());
    // Get.put<LeaveController>(LeaveController());
  }
}
