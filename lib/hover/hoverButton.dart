// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/fonts.dart';
import 'package:my_portfolio/hover/onHover.dart';

class HoverButton extends StatefulWidget {
  HoverButton({Key? key, required this.text}) : super(key: key);
  String text;
  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return OnHover(builder: (isHovered) {
      final color = isHovered ? Colors.blue : Colors.white70;
      return Text(
        widget.text,
        style: screenText(
            color: color,
            weight: isHovered ? FontWeight.bold : FontWeight.normal,
            size: 15),
      );
    });
  }
}
