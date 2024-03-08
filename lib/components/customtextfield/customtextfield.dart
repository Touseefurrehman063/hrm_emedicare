import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/helper/colormanager/color_manager.dart';

class EditTextField extends StatelessWidget {
  final bool? obscureText;
  final List<TextInputFormatter>? formatters;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final Widget? suffixIcon;
  final String? hintText;
  final bool? readOnly;
  final Widget? label;
  final int? maxLines;
  final ValueChanged<String>? onChangedwidget;
  final Color? bordercolor;
  final TextInputType? keyboardtype;

  const EditTextField({
    super.key,
    this.hintText,
    this.onChangedwidget,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.readOnly,
    this.formatters,
    this.obscureText,
    this.label,
    this.maxLines,
    this.bordercolor,
    this.onTap,
    this.keyboardtype,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 12,
        color: ColorManager.kGreyColor,
      ),
      onChanged: onChangedwidget,
      obscureText: obscureText ?? false,
      inputFormatters: formatters,
      readOnly: readOnly ?? false,
      validator: validator,
      controller: controller,
      maxLines: maxLines,
      onTap: onTap,
      keyboardType: keyboardtype,
      decoration: InputDecoration(
        label: label,
        errorStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: ColorManager.kRedColor, fontSize: 12),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        hintText: hintText,
        hintStyle:
            GoogleFonts.poppins(color: ColorManager.kblackColor, fontSize: 12),
        disabledBorder: const OutlineInputBorder(),
        errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.kRedColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: bordercolor ?? ColorManager.kGreyColor)),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: bordercolor ?? ColorManager.kGreyColor),
        ),
      ),
    );
  }
}
