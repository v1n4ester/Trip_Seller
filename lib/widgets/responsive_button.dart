// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:trip_seller/misc/colors.dart';
import 'package:trip_seller/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String? text;

  ResponsiveButton({
    Key? key,
    this.isResponsive = false,
    this.width,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Padding(
          padding: isResponsive == true ? const EdgeInsets.symmetric(horizontal: 20) : const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: isResponsive == true ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
            children: [
              if(text != null) AppText(text: text!, color: Colors.white),
              Image.asset(
                "img/right-arrow.png",
                color: Colors.white,
                width: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
