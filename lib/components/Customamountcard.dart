// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

class CustomAmountCard extends StatelessWidget {
  const CustomAmountCard({super.key});

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
                child: Image.asset(
                  Images.cross,
                  height: Get.height * 0.02,
                ),
              ),
              SizedBox(
                width: Get.width * 0.02,
              ),
              const Text("Fuel Rs 150")
            ],
          )
        ],
      ),
    );
  }
}
