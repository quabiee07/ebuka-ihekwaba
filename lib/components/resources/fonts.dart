import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class Fonts {
  static const itim = 'Itim';
}

TextStyle itimBold({double size = 14, Color color = black,  double? height}) {
  return TextStyle(
      fontFamily: Fonts.itim,
      fontSize: size,
      fontWeight: FontWeight.w700,
      height: height,
      color: color);
}

///When [fontWeight] is [FontWeight.w500] or [FontWeight.w600] use this text style
TextStyle itimMedium({double size = 14, Color color = black, double? height}) {
  return TextStyle(
      fontFamily: Fonts.itim,
      fontSize: size,
      fontWeight: FontWeight.w500,
      height: height,
      color: color);
}

///When [fontWeight] is [400] use this widget for text style
TextStyle itim({double size = 14, Color color = black, double? height}) {
  return TextStyle(
      fontFamily: Fonts.itim,
      fontSize: size,
      fontWeight: FontWeight.w400,
      height: height,
      color: color);
}

///When [fontWeight] is [FontWeight.w700] use this widget for text
class BoldText extends Text {
  final String data;

  BoldText(this.data, {super.key, double size = 14, Color color = black})
      : super(data, style: itimBold(size: size, color: color));
}

///When [fontWeight] is [FontWeight.w500] or [FontWeight.w600] use this text widget
class MediumText extends Text {
  final String data;

  MediumText(
    this.data, {
    super.key,
    double size = 14,
    Color color = black,
    TextAlign textAlign = TextAlign.start
  }) : super(
          data,
          style: itimMedium(size: size, color: color),
        );
}

///When [fontWeight] is [400] use this text widget
class NormalText extends Text {
  final String data;

  NormalText(
    this.data, {
    super.key,
    double size = 14,
    Color color = black,
  }) : super(data, style: itim(size: size, color: color));
}
