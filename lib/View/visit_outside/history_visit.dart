import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_emedicare/components/history_visit_card.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

class HistoryVisit extends StatelessWidget {
  const HistoryVisit({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.05, vertical: Get.height * 0.01),
        child: Column(children: [
          SizedBox(
            height: Get.height * 0.02,
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return HistoryVisitCard(
                  trailingcolor: ColorManager.kyellowContainer,
                  text: "Pending",
                );
              })
        ]),
      ),
    );
  }
}
