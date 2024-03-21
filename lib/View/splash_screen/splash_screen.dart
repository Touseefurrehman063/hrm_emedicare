// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hrm_emedicare/View/Dashboard/drawer.dart';
import 'package:hrm_emedicare/View/auth_screen/login.dart';
import 'package:get/get.dart';
import 'package:hrm_emedicare/data/controller/auth_controller/auth_controller.dart';
import 'package:hrm_emedicare/data/localdb/localdb.dart';
import 'package:hrm_emedicare/utils/constants/constants.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  instance() async {
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 10),
      ),
    );

    await remoteConfig.fetchAndActivate().then((value) {
      baseURL = remoteConfig.getString('URL');
      contactnumber = remoteConfig.getString('Phone');

      if (baseURL == "") {
        baseURL = 'http://hrmapi.e-mcs.org/';
      }
    }).onError((error, stackTrace) {
      baseURL = 'http://hrmapi.e-mcs.org/';
    }).timeout(const Duration(seconds: 03), onTimeout: () {
      baseURL = 'http://hrmapi.e-mcs.org/';
      contactnumber = '+923418495820';
    });
  }

  @override
  void initState() {
    instance();
    NewVersionPlus newVersion = NewVersionPlus();
    advancedStatusCheck(newVersion);
    initialize();
    super.initState();
  }

  void initialize() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  advancedStatusCheck(NewVersionPlus newVersion) async {
    try {
      final status = await newVersion.getVersionStatus();
      if (status != null) {
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        debugPrint(status.releaseNotes);
        debugPrint(status.appStoreLink);
        debugPrint(status.localVersion);
        debugPrint(status.storeVersion);
        debugPrint(status.canUpdate.toString());
        if (status.canUpdate) {
          newVersion.showUpdateDialog(
            context: context,
            versionStatus: status,
            dialogTitle: 'Update Required',
            dialogText:
                "${packageInfo.appName} requires a new Update ${status.storeVersion}",
            launchModeVersion: LaunchModeVersion.external,
            allowDismissal: false,
          );
        } else {
          String? userid = await Prefs().getUserId();

          if (userid != null && userid != "") {
            AuthController.i.getuserprofile();
            Get.offAll(() => const DrawerScreen());
          } else {
            Get.offAll(() => Login());
          }
        }
      } else {
        String? userid = await Prefs().getUserId();

        if (userid != null && userid != "") {
          AuthController.i.getuserprofile();
          Get.offAll(() => const DrawerScreen());
        } else {
          Get.offAll(() => Login());
        }
      }
    } catch (e) {
      String? userid = await Prefs().getUserId();

      if (userid != null && userid != "") {
        AuthController.i.getuserprofile();
        Get.offAll(() => const DrawerScreen());
      } else {
        Get.offAll(() => Login());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
