import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/data/controller/leave_controller/leave_controller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:hrm_emedicare/models/line_manager_model/line_manager_model.dart';

class CustomForwardcard extends StatelessWidget {
  final Linemanagerdata? obj;
  const CustomForwardcard({this.obj, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: ColorManager.kWhiteColor,
        border: Border.all(color: ColorManager.kGreyColor, width: 0.8),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  LeaveController.i.deletelinemanager(obj);
                },
                child: Image.asset(
                  Images.cross,
                  height: Get.height * 0.02,
                ),
              ),
              SizedBox(
                width: Get.width * 0.02,
              ),
              Text("${obj?.name}"),
            ],
          )
        ],
      ),
    );
  }
}
