import 'package:flutter/material.dart';
import 'package:market_stock/utils/normal_text.dart';

class StatusCard extends StatelessWidget {
  StatusCard(
      {Key? key,
      required this.text,
      required this.boxColor,
      required this.height,
      this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      required this.textColor,
      required this.width,
      this.fontWeight})
      : super(key: key);
  final String text;
  final Color boxColor;
  final double height;
  final double width;
  final Color textColor;
  EdgeInsets? padding;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: boxColor, borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Center(
          child: NormalText(
            text: text,
            color: textColor,
            size: 13,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
