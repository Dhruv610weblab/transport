import 'package:flutter/material.dart';
import 'package:transport/constants/colors.dart';

import '../../../../constants/text_style.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    super.key,
    required int status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: AppColors.green),
      child: Text(
        'Completed',
        style: AppTextStyle().subtitle6,
      ),
    );
  }
}
