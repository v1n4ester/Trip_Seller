// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:trip_seller/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  String? text;
  IconData? icon;

  AppButton({
    Key? key,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
    this.text,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: Center(child: text != null ? AppText(text: text!, color: color) : icon != null ? Icon(icon, color: color) : const SizedBox.shrink()),
    );
  }
}
