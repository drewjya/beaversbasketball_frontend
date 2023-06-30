import 'package:beaverbasketball/src/core/api/url.dart';
import 'package:flutter/material.dart';

extension WidgetString on String {
  Widget toWidget({
    int? index,
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
    if (index != null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$index.",
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
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
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
            ),
          )
        ],
      );
    }
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

  String get url {
    return "${ApiUrl.storage}/$this";
  }
}

extension TXC on TextEditingController {
  bool get isEmpty => text.isEmpty;
}
