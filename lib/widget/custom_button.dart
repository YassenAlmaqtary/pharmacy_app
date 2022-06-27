import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  double width, height;
  double? circularRadius;
  String text;
  Color? textColor, buttonColor;
  void Function()? onTap;

  CustomButton({
    required this.width,
    required this.height,
    required this.text,
    this.textColor,
    this.buttonColor,
    this.circularRadius = 0,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: width,
      height: height,
      child: MaterialButton(
        onPressed:onTap,
        child: CustomText(
          text: text,
          color: textColor,
          weight: FontWeight.bold,
        ),
        color: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularRadius!),
        ),
      ),
    );
  }
}
