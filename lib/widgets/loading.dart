import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingWidget extends StatelessWidget {
  final String? title;
  const LoadingWidget({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        CircularProgressIndicator(),
        SizedBox(
          height: Get.height * 0.02,
        ),
        Text(title ?? ""),
      ],
    );
  }
}
