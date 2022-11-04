import 'package:flutter/material.dart';

class NormalText extends StatelessWidget {
  double size;
  FontWeight? fontWeight;
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  TextTheme? textTheme;
  TextOverflow? overFlow;
  int? maxLines;

  NormalText({
    Key? key,
    this.size = 16.0,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.left,
    required this.text,
    this.textTheme,
    this.overFlow,
    this.maxLines,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overFlow,
      softWrap: false,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
