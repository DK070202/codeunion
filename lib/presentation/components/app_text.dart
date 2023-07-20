import 'package:codeunion/app/config/config.dart';
import 'package:flutter/material.dart';

enum Weight {
  light,
  regular,
  medium,
  semiBold,
  bold,
  extrabold,
}

@immutable
class AppText extends StatelessWidget {
  const AppText(
    this.data, {
    super.key,
    this.letterSpacing,
    this.style,
    this.textAlign,
    this.height = 1.5,
    this.fontSize = 14,
    this.color = Colors.black,
    this.fontWeight,
    this.maxLines,
    this.textOverflow,
    this.textDecoration,
    this.fontStyle = FontStyle.normal,
  });

  /// For heading1. Font size 28.
  const AppText.heading1(
    this.data, {
    super.key,
    this.height = 1.5,
    this.letterSpacing,
    this.textAlign,
    this.fontSize,
    this.color = Colors.black,
    this.fontWeight = Weight.bold,
    this.maxLines,
    this.textOverflow,
    this.textDecoration,
    this.fontStyle = FontStyle.normal,
  }) : style = AppTypography.heading1;

  /// For heading2. Font size 24.
  const AppText.heading2(
    this.data, {
    super.key,
    this.height = 1.5,
    this.letterSpacing,
    this.textAlign,
    this.fontSize,
    this.color = Colors.black,
    this.fontWeight = Weight.bold,
    this.maxLines,
    this.textOverflow,
    this.textDecoration,
    this.fontStyle = FontStyle.normal,
  }) : style = AppTypography.heading2;

  /// For heading3. Font size 20.
  const AppText.heading3(
    this.data, {
    super.key,
    this.height = 1.5,
    this.letterSpacing,
    this.textAlign,
    this.fontSize,
    this.color = Colors.black,
    this.fontWeight = Weight.semiBold,
    this.maxLines,
    this.textOverflow,
    this.textDecoration,
    this.fontStyle = FontStyle.normal,
  }) : style = AppTypography.heading3;

  /// For heading4. Font size 18.
  const AppText.heading4(
    this.data, {
    super.key,
    this.height = 1.5,
    this.letterSpacing,
    this.textAlign,
    this.fontSize,
    this.color = Colors.black,
    this.fontWeight = Weight.bold,
    this.maxLines,
    this.textOverflow,
    this.textDecoration,
    this.fontStyle = FontStyle.normal,
  }) : style = AppTypography.heading4;

  /// For subheading. Font size 16.
  const AppText.subheading(
    this.data, {
    super.key,
    this.height = 1.5,
    this.letterSpacing,
    this.textAlign,
    this.fontSize,
    this.color = Colors.black,
    this.fontWeight = Weight.medium,
    this.maxLines,
    this.textOverflow,
    this.textDecoration,
    this.fontStyle = FontStyle.normal,
  }) : style = AppTypography.subheading;

  /// For subtitle. Font size 12.
  const AppText.subtitle(
    this.data, {
    super.key,
    this.height = 1.5,
    this.letterSpacing,
    this.textAlign,
    this.fontSize,
    this.color = Colors.black,
    this.fontWeight = Weight.medium,
    this.maxLines,
    this.textOverflow,
    this.textDecoration,
    this.fontStyle = FontStyle.normal,
  }) : style = AppTypography.subtitle;

  /// For subtitle. Font size 10.
  const AppText.caption(
    this.data, {
    super.key,
    this.height = 1.5,
    this.letterSpacing,
    this.textAlign,
    this.fontSize,
    this.color = Colors.black,
    this.fontWeight = Weight.medium,
    this.maxLines,
    this.textOverflow,
    this.textDecoration,
    this.fontStyle = FontStyle.normal,
  }) : style = AppTypography.caption;

  /// For title. Font size 14.
  const AppText.title(
    this.data, {
    super.key,
    this.height = 1.5,
    this.letterSpacing,
    this.textAlign,
    this.fontSize,
    this.color = Colors.black,
    this.fontWeight = Weight.medium,
    this.maxLines,
    this.textOverflow,
    this.textDecoration,
    this.fontStyle = FontStyle.normal,
  }) : style = AppTypography.title;

  final String data;
  final TextStyle? style;
  final Color? color;
  final Weight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final double? height;
  final double? letterSpacing;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  final FontStyle fontStyle;

  /// Provides [FontWeight].Default value is [Weight.regular].
  ///
  FontWeight getWeight({
    Weight? weight = Weight.regular,
  }) {
    switch (weight) {
      case Weight.light:
        return FontWeight.w300;
      case Weight.regular:
        return FontWeight.w400;
      case Weight.medium:
        return FontWeight.w500;
      case Weight.semiBold:
        return FontWeight.w600;
      case Weight.bold:
        return FontWeight.w700;
      case Weight.extrabold:
        return FontWeight.w800;
      case _:
        return FontWeight.w400;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: style?.copyWith(
        fontStyle: fontStyle,
        height: height,
        fontSize: fontSize,
        color: color,
        fontWeight: getWeight(
          weight: fontWeight,
        ),
        letterSpacing: letterSpacing,
        decoration: textDecoration,
      ),
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
