import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/data/controller/leave_controller/leave_controller.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

class RegisterLMPCCustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final int? maxlines;
  final Widget? prefixIcon;
  final TextStyle? suffixStyle;
  final String? suffixText;
  final bool? isSizedBoxAvailable;
  final bool readonly;
  final Color? fillColor;
  final Widget? suffixIcon;
  final String? hintText;
  final Function(String)? onchanged;
  const RegisterLMPCCustomTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.fillColor = ColorManager.kPrimaryLightColor,
    this.readonly = false,
    this.isSizedBoxAvailable = true,
    this.suffixText,
    this.suffixStyle,
    this.prefixIcon,
    this.maxlines,
    this.padding,
    this.onTap,
    this.validator,
    this.inputFormatters,
    this.onchanged,
    this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeaveController>(
      builder: (cont) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            controller: controller,
            onChanged: onchanged,
            validator: validator,
            onTap: onTap ?? () {},
            maxLines: maxlines ?? 1,
            readOnly: readonly,
            style: GoogleFonts.poppins(
                color: ColorManager.kblackColor, fontSize: 12),
            decoration: InputDecoration(
              // enabled: false,
              // focusedBorder: InputBorder.none,
              errorStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: ColorManager.kRedColor, fontSize: 12),
              contentPadding: EdgeInsets.only(left: Get.width * 0.33),
              hintStyle: GoogleFonts.poppins(
                  color: ColorManager.kWhiteColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              hintText: "attachfile".tr,
              filled: true,
              disabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: ColorManager.kOrangeColor),
              ),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: ColorManager.kRedColor)),
              fillColor: ColorManager.kOrangeColor,
              suffixIcon: suffixIcon,
              suffixText: suffixText,
              suffixStyle: suffixStyle,
              prefixIcon: prefixIcon,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            inputFormatters: inputFormatters,
          ),
          isSizedBoxAvailable == true
              ? const SizedBox(
                  //  height: Get.height * 0.02,
                  )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
