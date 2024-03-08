import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hrm_emedicare/View/Dashboard/attendance.dart';
import 'package:hrm_emedicare/View/Dashboard/drawer.dart';
import 'package:hrm_emedicare/View/profile/profile.dart';
import 'package:hrm_emedicare/View/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'package:hrm_emedicare/data/controller/language_controller/language_controller.dart';
import 'package:hrm_emedicare/data/localdb/localdb.dart';
import 'package:hrm_emedicare/helper/routerclass/myrouter.dart';
import 'package:hrm_emedicare/models/language_model/language_model.dart';
import 'package:hrm_emedicare/utils/constants/constants.dart';
import 'package:hrm_emedicare/utils/init/init.dart';
import 'package:hrm_emedicare/utils/language/language.dart';

void main() {
  var path = Directory.current.path;
  Hive.init(path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) => GetMaterialApp(
        textDirection: TextDirection.ltr,
        routes: {
          Myrouting.home: (context) => const DrawerScreen(),
          Myrouting.profile: (context) => const Userprofile(),
          Myrouting.attendence: (p0) => Attendancescreen(),
          Myrouting.splashScreen: (p0) => const SplashScreen()
        },
        initialRoute: Myrouting.splashScreen,
        translations: Localization(),
        locale: const Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        initialBinding: AppBindings(),
      ),
    );
  }
}

getLocale() async {
  LanguageModel? lang = await Prefs().getLanguage();
  if (lang == null) {
    lang = LanguageModel(
        id: 1, name: 'English', image: null, locale: const Locale('en', 'US'));
    Get.updateLocale(lang.locale!);
    LanguageController.i.selected = AppConstants.languages[0];
  } else {
    Get.updateLocale(lang.locale!);
  }
  if (lang.id == 1) {
    LanguageController.i.selected = AppConstants.languages[0];
  } else {
    LanguageController.i.selected = AppConstants.languages[1];
  }
}
