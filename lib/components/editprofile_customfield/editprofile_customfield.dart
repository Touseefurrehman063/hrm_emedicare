import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

// ignore: must_be_immutable
class EditProfileCustomTextField extends StatelessWidget {
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
  TextInputType? keyboardTypenew;
  EditProfileCustomTextField({
    super.key,
    this.keyboardTypenew,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextFormField(
          keyboardType: keyboardTypenew,
          controller: controller,
          onChanged: onchanged,
          validator: validator,
          onTap: onTap ?? () {},
          maxLines: maxlines ?? 1,
          readOnly: readonly,
          style: GoogleFonts.poppins(
              color: ColorManager.kLightBlue,
              fontSize: 12,
              fontWeight: FontWeight.w700),
          decoration: InputDecoration(
            errorStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: ColorManager.kPrimaryLightColor, fontSize: 12),
            contentPadding:
                padding ?? const EdgeInsets.symmetric(horizontal: 20),
            hintStyle: GoogleFonts.poppins(
                fontSize: 12,
                color: ColorManager.kblueColor,
                fontWeight: FontWeight.w700),
            hintText: hintText,
            filled: true,
            disabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorManager.kPrimaryLightColor,
                ),
                borderRadius: BorderRadius.circular(8)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: ColorManager.kPrimaryLightColor,
              ),
            ),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorManager.kRedColor)),
            fillColor: ColorManager.kPrimaryLightColor,
            suffixIcon: suffixIcon,
            suffixText: suffixText,
            suffixStyle: suffixStyle,
            prefixIcon: prefixIcon,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.kPrimaryLightColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(0.0),
              ),
            ),
          ),
          inputFormatters: inputFormatters,
        ),
        isSizedBoxAvailable == true
            ? SizedBox(
                height: Get.height * 0.02,
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
