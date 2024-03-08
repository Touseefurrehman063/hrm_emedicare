import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/components/Images/Images.dart';
import 'package:hrm_emedicare/data/controller/NoticeBoard/noticeboardcontroller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

// ignore: must_be_immutable
class NoticeDetail extends StatelessWidget {
  NoticeDetail({super.key});
  bool checkval = true;
  String text =
      "Dear E-mcs k vhutiyo Members We hope this message finds you well. We would like to inform you that Organization/School/Institution will be observing Kashmeer Day on [date]. In honor of this significant day, the institution will remain closed, and there will be no classes/office activities.Kashmeer Day is a day to reflect upon the historical and cultural significance of the Kashmir region. It serves as a reminder of the aspirations and struggles of the people of Kashmir. On this occasion, let us take a moment to recognize and appreciate the rich cultural heritage of the region.We encourage all members of the [Organization/School/Institution] community to use this day as an opportunity for reflection, learning, and fostering a deeper understanding of the issues surrounding Kashmir. We also extend our best wishes to those observing Kashmeer Day, and we hope for peace and prosperity in the region.Regular activities will resume on [next working day].We appreciate your understanding and cooperation.\nThank you.\nSincerely,\n[Your Name]\n[Your Position]\n[Organization/School/Institution Name]";
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final cont = Get.put(NoticeBoardController());
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                Directory? pth;
                if (Platform.isAndroid) {
                  pth = await getDownloadsDirectory();
                } else if (Platform.isIOS) {
                  pth = await getApplicationDocumentsDirectory();
                }
                if (pth != null) {
                  final file = File('${pth.path}/NoticeBoard1.pdf');
                  try {
                    final PdfDocument document = PdfDocument();
                    document.pages.add().graphics.drawString(
                        'Dear E-mcs k vhutiyo Members We hope this message finds you well. We would like to inform you that Organization/School/Institution will be observing Kashmeer Day on [date]. In honor of this significant day, the institution will remain closed, and there will be no classes/office activities.Kashmeer Day is a day to reflect upon the historical and cultural significance of the Kashmir region. It serves as a reminder of the aspirations and struggles of the people of Kashmir. On this occasion, let us take a moment to recognize and appreciate the rich cultural heritage of the region.We encourage all members of the [Organization/School/Institution] community to use this day as an opportunity for reflection, learning, and fostering a deeper understanding of the issues surrounding Kashmir. We also extend our best wishes to those observing Kashmeer Day, and we hope for peace and prosperity in the region.Regular activities will resume on [next working day].We appreciate your understanding and cooperation.\nThank you.\nSincerely,\n[Your Name]\n[Your Position]\n[Organization/School/Institution Name]',
                        PdfStandardFont(PdfFontFamily.helvetica, 12),
                        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
                        bounds: Rect.fromLTWH(0, 0, Get.width, Get.height * 1));
                    final resp = await File(file.path)
                        .writeAsBytes(await document.save());

                    log(resp.toString());
                    await Share.shareFiles([resp.path]);
                    document.dispose();
                  } catch (e) {
                    log(e.toString());
                  }
                }
              },
              icon: const Icon(
                Icons.share,
                color: ColorManager.kblackColor,
              ))
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorManager.kWhiteColor,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: ColorManager.kblackColor,
          ),
        ),
        title: Text(
          "Notice Board",
          style: GoogleFonts.poppins(
              fontSize: 20.h,
              color: ColorManager.kOrangeColor,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width * 0.04,
                        vertical: Get.width * 0.03),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorManager.klightgrey,
                      border: Border.all(
                        color: ColorManager.klightgrey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.asset(
                      Images.notice,
                      height: Get.height * 0.04,
                    ),
                  ),
                  const Text(
                    "Kashmeer Day Holiday \nNotification",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                child: Row(
                  children: [
                    Image.asset(
                      Images.user,
                      height: Get.height * 0.02,
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    Text(
                      "Sharique Raza",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.04,
                    ),
                    Image.asset(
                      Images.calender,
                      height: Get.height * 0.02,
                    ),
                    SizedBox(
                      width: Get.width * 0.02,
                    ),
                    Text(
                      "Jan 10, 2024",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              const Divider(
                thickness: 1,
                color: ColorManager.kGreyColor,
              ),
              // SizedBox(
              //   height: Get.height * 0.02,
              // ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Text(
                      "Notice Detail",
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              const Text(
                  "Dear [Organization/School/Institution] Members,We hope this message finds you well. We would like to inform you that [Organization/School/Institution] will be observing Kashmeer Day on [date]. In honor of this significant day, the institution will remain closed, and there will be no classes/office activities.Kashmeer Day is a day to reflect upon the historical and cultural significance of the Kashmir region. It serves as a reminder of the aspirations and struggles of the people of Kashmir. On this occasion, let us take a moment to recognize and appreciate the rich cultural heritage of the region.We encourage all members of the [Organization/School/Institution] community to use this day as an opportunity for reflection, learning, and fostering a deeper understanding of the issues surrounding Kashmir. We also extend our best wishes to those observing Kashmeer Day, and we hope for peace and prosperity in the region.Regular activities will resume on [next working day].We appreciate your understanding and cooperation.\nThank you.\nSincerely,\n[Your Name]\n[Your Position]\n[Organization/School/Institution Name]")
            ],
          ),
        ),
      ),
    );
  }
}
