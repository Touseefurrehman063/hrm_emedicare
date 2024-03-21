import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:hrm_emedicare/utils/class_toaster.dart';

class LocationController extends GetxController {
  bool isInLoading = false;
  updateisInLoading(bool val) {
    isInLoading = val;
    update();
  }

  bool isOutLoading = false;
  updateisOutLoading(bool val) {
    isOutLoading = val;
    update();
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Showtoaster().classtoaster(
        "Enable Location permissions",
        ColorManager.kRedColor,
      );
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Showtoaster().classtoaster(
          "Enable Location permissions",
          ColorManager.kRedColor,
        );
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<String> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks[0];
    return '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  }

  static LocationController get i => Get.put(LocationController());
}
