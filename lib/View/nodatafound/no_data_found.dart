import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

// ignore: must_be_immutable
class NoDataFound extends StatelessWidget {
  // ignore: non_constant_identifier_names
  String? Title;
  // ignore: non_constant_identifier_names
  NoDataFound({super.key, this.Title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Title ?? ""),
        backgroundColor: ColorManager.kOrangeColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: ColorManager.kWhiteColor,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: const Center(
        child: Text('No data found!'),
      ),
    );
  }
}
