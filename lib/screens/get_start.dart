import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport/constants/text_style.dart';

import '../constants/colors.dart';
import '../widgets/button.dart';
import 'bottom_nav.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset('assets/images/getstart.png', scale: 3),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    Text('Enjoy the Shipping with me',
                        style: AppTextStyle().heading2,
                        textAlign: TextAlign.center),
                    Text(
                        'Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text',
                        style: AppTextStyle().subtitle1,
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
              AppButton(
                isExpanded: true,
                text: 'Get Started',
                textColor: AppColors.white,
                btnColor: AppColors.primary1,
                onClick: () => Get.offAll(() => Home()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
