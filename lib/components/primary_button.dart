import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrm_emedicare/data/controller/auth_controller/auth_controller.dart';
import 'package:hrm_emedicare/helper/fontmanager/font_manager.dart';

class PrimaryButton extends StatelessWidget {
  final bool? isDisabled;
  final double? radius;
  final FontWeight? fontweight;
  final Widget? textWidget;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final Color color;
  final Color textcolor;
  final String? title;
  final double? fontSize;
  final VoidCallback onPressed;
  final Widget? icon;
  final bool? primaryIcon;
  final BoxBorder? border;
  const PrimaryButton(
      {Key? key,
      this.height = 50,
      this.margin,
      this.title,
      required this.onPressed,
      required this.color,
      required this.textcolor,
      this.fontSize = FontSize.s20,
      this.icon,
      this.primaryIcon = false,
      this.width,
      this.padding,
      this.textWidget,
      this.fontweight = FontWeight.w900,
      this.border,
      this.radius = 10,
      this.isDisabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (cont) {
      return GestureDetector(
        onTap: onPressed,
        child: Container(
            margin: margin,
            padding: padding,
            height: height,
            width: width ?? double.infinity,
            decoration: BoxDecoration(
              border: border,
              color: color,
              borderRadius: BorderRadius.circular(radius!),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                primaryIcon == true ? icon! : const SizedBox(),
                const SizedBox(
                  width: 8,
                ),
                Center(
                    child: textWidget ??
                        Text(
                          title ?? "",
                          style: GoogleFonts.poppins(
                            fontSize: fontSize,
                            color: textcolor,
                            fontWeight: fontweight,
                          ),
                          textAlign: TextAlign.center,
                        )),
              ],
            )),
      );
    });
  }
}
