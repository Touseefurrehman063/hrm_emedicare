import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

searchableDropdown(
  BuildContext context,
  List<dynamic> val,
) async {
  TextEditingController search = TextEditingController();
  dynamic generic;
  String title = "";
  // ignore: unused_local_variable
  String? errorText; // Added errorText to hold validation error message.

  await showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: ColorManager.kPrimaryColor),
                        hintText: 'search'.tr,
                        filled: true,
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: ColorManager.kPrimaryLightColor),
                            borderRadius: BorderRadius.circular(8)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: ColorManager.kPrimaryLightColor),
                        ),
                        fillColor: ColorManager.kPrimaryLightColor,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: ColorManager.kPrimaryColor,
                        ),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorManager.kPrimaryLightColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(0.0),
                          ),
                        ),
                      ),
                      controller: search,
                      onChanged: (val) {
                        title = val;
                        setState(() {
                          title = val;
                        });
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: ListView.builder(
                        itemCount: val.length,
                        itemBuilder: ((context, index) {
                          if (search.text.isEmpty ||
                              val[index]
                                  .name
                                  .toString()
                                  .toLowerCase()
                                  .contains(title.toLowerCase())) {
                            return InkWell(
                              onTap: () {
                                generic = val[index];
                                Navigator.pop(context);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Text(val[index].name),
                                  const Divider()
                                ],
                              ),
                            );
                          } else {
                            return Container();
                          }
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );

  return generic;
}
