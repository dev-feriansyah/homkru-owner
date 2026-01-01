import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homekru_owner/core/theme/app_colors.dart';

class CText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? fontFamily;
  final TextDecoration? decoration;
  final double? thickness;
  final Color? decorationColor;
  final List<Shadow>? shadow;
  final double? height;
  final double? letterSpacing; // 👈 Added
  final FontStyle? fontStyle; // 👈 Added (italic / normal)
  final TextStyle? style;
  const CText(
    this.text, {
    super.key,
    this.size,
    this.color,
    this.weight,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontFamily,
    this.decoration,
    this.thickness,
    this.decorationColor,
    this.shadow,
    this.height,
    this.letterSpacing, // 👈
    this.fontStyle, // 👈
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow,

      style:
          style ??
          TextStyle(
            fontSize: size ?? 16.sp,
            color: color ?? appColors.black,
            fontWeight: weight ?? FontWeight.normal,
            fontFamily: fontFamily ?? "Poppins",
            decoration: decoration,
            decorationThickness: thickness,
            decorationColor: decorationColor,
            shadows: shadow ?? [],
            height: height,
            letterSpacing: letterSpacing, // 👈 Added
            fontStyle: fontStyle, // 👈 Added
          ),
    );
  }
}
