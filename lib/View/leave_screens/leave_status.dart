import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrm_emedicare/components/customattendancecard.dart';
import 'package:hrm_emedicare/components/leavestatuscard.dart';
import 'package:hrm_emedicare/data/controller/leave_controller/leave_controller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

class LeaveStatus extends StatelessWidget {
  const LeaveStatus({super.key});

  @override
  Widget build(BuildContext context) {
    LeaveController.i.getleavestatus();
    return SingleChildScrollView(
      child: GetBuilder<LeaveController>(builder: (cont) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.05, vertical: Get.height * 0.01),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Customattandencestatuscard(
                  color: const Color(0xff23B480),
                  title: 'annual'.tr,
                  total: cont.annual?.allocatedLeaves?.toString() ?? "0",
                  count: cont.annual?.availedLeaves?.toString() ?? "0",
                ),
                Customattandencestatuscard(
                    color: const Color(0xffFF455E),
                    title: 'sick'.tr,
                    total: cont.sick?.allocatedLeaves?.toString() ?? "0",
                    count: cont.sick?.allocatedLeaves?.toString() ?? "0"),
                Customattandencestatuscard(
                    color: const Color(0xff663CDE),
                    title: 'casual'.tr,
                    total: cont.casual?.allocatedLeaves?.toString() ?? "0",
                    count: cont.casual?.allocatedLeaves?.toString() ?? "0"),
                Customattandencestatuscard(
                    color: const Color(0xffF2B42A),
                    title: 'other'.tr,
                    total: cont.other?.allocatedLeaves?.toString() ?? "0",
                    count: cont.other?.allocatedLeaves?.toString() ?? "0"),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  String leaveStatus =
                      "${LeaveController.i.leavestatus?.table?[index].leaveStatus}";
                  Color? trailingColor;
                  switch (leaveStatus.toLowerCase()) {
                    case 'rejected':
                      trailingColor = ColorManager.kRedColor;
                      break;
                    case 'forward':
                      trailingColor = ColorManager.kyellowContainer;
                      break;
                    case 'approved':
                      trailingColor = ColorManager.KgreenColor;
                      break;
                    case 'cancel':
                      trailingColor = ColorManager.kRedColor;
                      break;

                    default:
                      trailingColor = Colors.grey;
                      break;
                  }
                  return LeaveStatusCard(
                    trailingcolor: trailingColor,
                    text: leaveStatus,
                    i: index,
                  );
                })
          ]),
        );
      }),
    );
  }

  static LeaveStatus? fromJson(result) {
    return null;
  }
}
