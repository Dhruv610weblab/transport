import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport/screens/auth_screens/view/forgot_password_widget.dart';
import 'package:transport/screens/auth_screens/view/login_widget.dart';
import 'package:transport/screens/auth_screens/view/new_password.dart';
import 'package:transport/widgets/background.dart';
import 'package:transport/widgets/icon_title.dart';
import '../controller/state_change.dart';
import 'verify_otp_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Container(
          margin: EdgeInsets.only(top: Get.height * 0.08),
          child: Column(
            children: [
              IconHeading(),
              SizedBox(height: Get.height * 0.02),
              GetBuilder<StateChangeController>(
                  init: StateChangeController(),
                  builder: (stateChangeController) {
                    print(stateChangeController.indexPage.value);
                    return stateChangeController.indexPage.value == 0
                        ? LoginWidget(stateChangeController)
                        : stateChangeController.indexPage.value == 1
                            ? ForgotPasswordWidget(stateChangeController)
                            : stateChangeController.indexPage.value == 2
                                ? VerifyOtpWidget(stateChangeController)
                                : NewPasswordWidget(stateChangeController);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
