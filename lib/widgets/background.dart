import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login_back.png'),
                fit: BoxFit.fill)),
        child: Container(color: AppColors.shade, child: child),
      ),
    );
  }
}
