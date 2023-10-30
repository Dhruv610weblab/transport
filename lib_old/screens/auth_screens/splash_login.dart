import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport/constants/colors.dart';
import 'package:transport/screens/auth_screens/view/login.dart';
import 'package:transport/widgets/background.dart';
import 'package:transport/widgets/button.dart';
import 'package:transport/widgets/icon_title.dart';

import 'controller/state_change.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  StateChangeController stateChangeController =
      Get.put(StateChangeController());
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: IconHeading(isCenter: true),
            ),

            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      child: AppButton(
                        text: "Login",
                        isExpanded: true,
                        textColor: AppColors.white,
                        btnColor: AppColors.primary1,
                        onClick: () {
                          stateChangeController.indexPage.value = 0;
                          Get.offAll(() => LoginScreen());
                        },
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.01,
                    ),
                    Container(
                      child: AppButton(
                        text: "Forgot Password?",
                        isExpanded: true,
                        textColor: AppColors.white,
                        btnColor: AppColors.transparent,
                        onClick: () {

                          stateChangeController.indexPage.value = 1;
                          Get.off(() => LoginScreen());
                        },
                      ),
                    ),
                  ],
                ))
            // Expanded(flex: 1, child: Image.asset('assets/logo.png')),
            // Expanded(flex: 1, child: Image.asset('assets/logo.png'))
          ],
        ),
      ),
    );
  }
}
