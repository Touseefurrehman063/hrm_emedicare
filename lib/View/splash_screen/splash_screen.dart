// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:hrm_emedicare/View/Dashboard/drawer.dart';
import 'package:hrm_emedicare/View/auth_screen/login.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:get/get.dart';

import 'package:hrm_emedicare/data/controller/auth_controller/auth_controller.dart';
import 'package:hrm_emedicare/data/localdb/localdb.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigateToNextScreen() {
    Future.delayed(const Duration(milliseconds: 3500), () async {
      String? username = await Prefs().getuser();

      if (username != null) {
        AuthController.i.getuserprofile();
        Get.offAll(() => const DrawerScreen());
      } else {
        Get.offAll(() => Login());
      }
    });
  }

  // instance() async {
  //   final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  //   await remoteConfig.setConfigSettings(
  //     RemoteConfigSettings(
  //       fetchTimeout: const Duration(seconds: 10),
  //       minimumFetchInterval: const Duration(seconds: 10),
  //     ),
  //   );

  //   await remoteConfig.fetchAndActivate().then((value) {
  //     baseURL = remoteConfig.getString('URL');
  //     contactnumber = remoteConfig.getString('Phone');

  //     if (baseURL == "") {
  //       baseURL = 'http://192.168.88.254:330';
  //     }
  //   }).onError((error, stackTrace) {
  //     baseURL = 'http://192.168.88.254:330';
  //   }).timeout(const Duration(seconds: 03), onTimeout: () {
  //     baseURL = 'http://192.168.88.254:330';
  //     contactnumber = '';
  //   });
  // }

  // @override
  // void initState() {
  //   instance();
  //   NewVersionPlus newVersion = NewVersionPlus();
  //   advancedStatusCheck(newVersion);
  //   super.initState();
  // }

  // advancedStatusCheck(NewVersionPlus newVersion) async {
  //   try {
  //     final status = await newVersion.getVersionStatus();
  //     if (status != null) {
  //       PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //       debugPrint(status.releaseNotes);
  //       debugPrint(status.appStoreLink);
  //       debugPrint(status.localVersion);
  //       debugPrint(status.storeVersion);
  //       debugPrint(status.canUpdate.toString());
  //       if (status.canUpdate) {
  //         newVersion.showUpdateDialog(
  //           context: context,
  //           versionStatus: status,
  //           dialogTitle: 'Update Required',
  //           dialogText:
  //               "${packageInfo.appName} requires a new Update ${status.storeVersion}",
  //           launchModeVersion: LaunchModeVersion.external,
  //           allowDismissal: false,
  //         );
  //       } else {
  //         String? username = await Prefs().getuser();

  //         if (username != null) {
  //           AuthController.i.getuserprofile();
  //           Get.offAll(() => const DrawerScreen());
  //         } else {
  //           Get.offAll(() => Login());
  //         }
  //       }
  //     } else {
  //       String? username = await Prefs().getuser();

  //       if (username != null) {
  //         AuthController.i.getuserprofile();
  //         Get.offAll(() => const DrawerScreen());
  //       } else {
  //         Get.offAll(() => Login());
  //       }
  //     }
  //   } catch (e) {
  //     String? username = await Prefs().getuser();

  //     if (username != null && username != "") {
  //       AuthController.i.getuserprofile();
  //       Get.offAll(() => const DrawerScreen());
  //     } else {
  //       Get.offAll(() => Login());
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    _navigateToNextScreen();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Images.logobackground),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SlideTransitions(
            image: Center(
              child: Image.asset(
                Images.logo,
                width: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SlideTransitions extends StatelessWidget {
  final Widget? image;

  const SlideTransitions({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransitionWidget(image: image);
  }
}

class SlideTransitionWidget extends StatefulWidget {
  final Widget? image;

  const SlideTransitionWidget({Key? key, this.image}) : super(key: key);

  @override
  _SlideTransitionWidgetState createState() => _SlideTransitionWidgetState();
}

class _SlideTransitionWidgetState extends State<SlideTransitionWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Padding(padding: const EdgeInsets.all(8.0), child: widget.image),
    );
  }
}
