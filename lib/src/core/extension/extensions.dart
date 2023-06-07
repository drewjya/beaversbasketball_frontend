import 'package:flutter/material.dart';

extension WidgetString on String {
  Widget toWidget({
    FontWeight? fontWeight,
    Color? color,
    double? fontSize,
    String? fontFamily,
    FontStyle? fontStyle,
    TextOverflow? overflow,
    TextAlign? textAlign,
    int? maxLines,
    TextDirection? textDirection,
    TextStyle? style,
  }) {
    return Text(
      this,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
      textDirection: textDirection,
      style: style ??
          TextStyle(
            fontWeight: fontWeight,
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontStyle: fontStyle,
            color: color,
          ),
    );
  }
}
