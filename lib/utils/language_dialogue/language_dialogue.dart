import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/data/controller/language_controller/language_controller.dart';
import 'package:hrm_emedicare/data/localdb/localdb.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';
import 'package:hrm_emedicare/models/language_model/language_model.dart';

Future<String?> languageSelector(
    BuildContext context, List<LanguageModel> languageList) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) =>
        StatefulBuilder(builder: (context, newState) {
      LanguageController.i.updateSelected(LanguageController.i.selected);
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        backgroundColor: ColorManager.kYellowColor,
        title: Text(
          'selectLanguage'.tr,
          style: TextStyle(color: Theme.of(context).secondaryHeaderColor),
        ),
        content: SingleChildScrollView(
            child: SizedBox(
          width: Get.width,
          child: GetBuilder<LanguageController>(builder: (cont) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: languageList.length,
                itemBuilder: (context, index) {
                  final lang = languageList[index];
                  log(lang.toJson().toString());
                  return RadioListTile<LanguageModel>(
                    fillColor:
                        MaterialStateProperty.all(ColorManager.kWhiteColor),
                    activeColor: Colors.white,
                    value: lang,
                    groupValue: cont.selected,
                    onChanged: (LanguageModel? lang) {
                      if (lang != null) {
                        newState(
                          () {
                            // log(lang.name.toString());
                            cont.updateSelectedIndex(index);
                            cont.updateSelected(lang);
                          },
                        );
                      }
                    },
                    title: Text(
                      lang.name!,
                      style: const TextStyle(color: ColorManager.kWhiteColor),
                    ),
                  );
                });
          }),
        )),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor: const MaterialStatePropertyAll(
                            ColorManager.kOrangeColor),
                      ),
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: Text('cancel'.tr)),
                ),
                const SizedBox(
                  width: 10,
                ),
                GetBuilder<LanguageController>(builder: (cont) {
                  return Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor: const MaterialStatePropertyAll(
                              ColorManager.kOrangeColor),
                        ),
                        onPressed: () {
                          cont.updateLocale(cont.selected!.locale!);
                          Prefs().setLanguage(cont.selected);
                          Navigator.pop(context, 'ok'.tr);
                        },
                        child: Text(
                          'ok'.tr,
                          style: GoogleFonts.poppins(color: Colors.white),
                        )),
                  );
                })
              ],
            ),
          )
        ],
      );
    }),
  );
}
