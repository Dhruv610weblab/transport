import 'package:flutter/material.dart';
import 'package:transport/constants/text_style.dart';

class IconHeading extends StatelessWidget {
  final bool isCenter;
  const IconHeading({
    super.key,
    this.isCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: isCenter == false
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logo.png',
          scale: isCenter == false ? 4 : 3,
        ),
        Text(
          'Enjoy the Shipping with me',
          style: AppTextStyle().heading1,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
