import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final bool? isNetworkImage;
  final Function()? onpressed;
  final bool? isSvg;
  final Color? color;
  final Color? backgroundColor;
  final String? imagePath;
  final double? height;
  final double? width;
  const ImageContainer({
    super.key,
    this.imagePath,
    this.color,
    this.backgroundColor,
    this.isSvg = true,
    this.onpressed,
    this.isNetworkImage,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: backgroundColor),
        child: IconButton(onPressed: onpressed, icon: Image.asset(imagePath!)));
  }
}
