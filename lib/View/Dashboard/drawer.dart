import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hrm_emedicare/View/Dashboard/dashboard.dart';
import 'package:hrm_emedicare/View/Dashboard/menuscreen.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
        dragOffset: 40,
        // controller: ProfileController.i.zoomDrawerController,
        showShadow: true,
        shadowLayer2Color: ColorManager.kbackgroundcolor,
        menuBackgroundColor: const Color(0xffFFC700),
        angle: 0,
        slideWidth: 300,
        // drawerShadowsBackgroundColor: Colors.transparent,
        menuScreen: const MenuScreen(),
        // ),
        mainScreen: Dashboard());
  }
}
