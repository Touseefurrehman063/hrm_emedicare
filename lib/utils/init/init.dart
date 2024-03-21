import 'package:get/get.dart';
import 'package:hrm_emedicare/data/controller/attendence_controller/attendancecontroller.dart';
import 'package:hrm_emedicare/data/controller/auth_controller/auth_controller.dart';
import 'package:hrm_emedicare/data/controller/get_current_location_controller.dart';
import 'package:hrm_emedicare/data/controller/network_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<NetworkController>(NetworkController(), permanent: true);
    Get.put<Attendancecontroller>(Attendancecontroller());
    Get.put<LocationController>(LocationController());
  }
}
