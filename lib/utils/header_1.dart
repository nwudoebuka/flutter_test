import 'package:flutter/material.dart';

class HeaderOne extends StatelessWidget {
  double size;
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  TextTheme? textTheme;
  TextOverflow? overflow;
  int? maxLines;

  HeaderOne(
      {Key? key,
      this.size = 36,
      required this.text,
      this.textAlign = TextAlign.left,
      this.textTheme,
      this.overflow,
      this.maxLines,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
