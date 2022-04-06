import 'package:flutter/material.dart';
import 'package:renmoney_task/core/core.dart';

/// Base text with black color and letter spacing set
///  [AppTextBase] .
class AppTextBase extends StatelessWidget {
  const AppTextBase(
    this.text, {
    this.style,
    this.textAlign = TextAlign.left,
    this.overflow = TextOverflow.visible,
    this.maxLines = 1,
    Key? key,
  }) : super(key: key);
  final String? text;
  final TextStyle? style;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    assert(text != null, 'test can not be null');
    return Text(
      text ?? '',
      style: const TextStyle(
        fontSize: 15,
      ).merge(style),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}

///  [TextBold] .
class TextBold extends AppTextBase {
  TextBold(
    String text, {
    Key? key,
    TextStyle? style,
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w700,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow overflow = TextOverflow.visible,
    int maxLines = 2,
  }) : super(
          text,
          key: key,
          overflow: overflow,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color ?? AppColors.darkText,
          ).merge(style),
          textAlign: textAlign,
        );
}

///  [TextRegular] .
class TextRegular extends AppTextBase {
  TextRegular(
    String text, {
    Key? key,
    TextStyle? style,
    double fontSize = 13,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    TextAlign textAlign = TextAlign.left,
    TextOverflow overflow = TextOverflow.visible,
    int maxLines = 2,
  }) : super(
          text,
          key: key,
          overflow: overflow,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color ?? AppColors.darkText,
          ).merge(style),
          textAlign: textAlign,
        );
}
