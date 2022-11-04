import 'package:flutter/material.dart';

class HeaderTwo extends StatelessWidget {
  double size;
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  TextTheme? textTheme;
  TextOverflow? overflow;
  int? maxLines;

  HeaderTwo(
      {Key? key,
      this.size = 30,
      required this.text,
      this.textAlign = TextAlign.left,
      this.textTheme,
      this.overflow,
      this.maxLines,
      this.color = Colors.grey})
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
