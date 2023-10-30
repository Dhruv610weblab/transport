import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final bool? isExpanded;
  final bool? isUpperCase;
  final double? height;
  final String? text;
  final double padding;
  final Color textColor;
  final Color btnColor;
  final Function onClick;
  final double textSize;
  const AppButton({
    Key? key,
    this.isExpanded = false,
    this.isUpperCase = false,
    this.padding = 12.0,
    this.height = 50,
    required this.text,
    required this.textColor,
    required this.btnColor,
    required this.onClick,
    this.textSize = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        height: height,
        width: isExpanded == true
            ? MediaQuery.of(context).size.width
            : MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.all(isExpanded == true ? 12.0 : padding),
        decoration: BoxDecoration(
            color: btnColor, borderRadius: BorderRadius.circular(100.0)),
        child: Center(
          child: Text(
            isUpperCase == true
                ? text.toString().toUpperCase()
                : text.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: textSize),
          ),
        ),
      ),
    );
  }
}
