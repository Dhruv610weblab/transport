import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport/constants/colors.dart';
import 'package:transport/constants/text_style.dart';
import 'package:transport/constants/validators.dart';
import 'package:transport/screens/auth_screens/controller/forgot_controller.dart';
import 'package:transport/screens/auth_screens/controller/login_controller.dart';
import 'package:transport/widgets/button.dart';
import '../../../widgets/loading.dart';
import '../controller/state_change.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final StateChangeController
      stateChangeController; // Add the controller as a parameter
  ForgotPasswordWidget(this.stateChangeController);
  LoginController loginController = Get.put(LoginController());
  final _formKeyForgot = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(58), topRight: Radius.circular(58))),
        child: GetBuilder<ForgotController>(
            init: ForgotController(),
            builder: (forgotController) {
              return Form(
                key: _formKeyForgot,
                child: Obx(
                  () => forgotController.isForgot.value == true
                      ? LoadingWidget(title: "Sending OTP...")
                      : Container(
                          padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
                          child: ListView(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Forgot Password",
                                style: AppTextStyle().heading2,
                              ),
                              SizedBox(
                                height: Get.height * 0.04,
                              ),
                              TextFormField(
                                cursorColor: AppColors.primary1,
                                validator: Validators.notEmpty,
                                onChanged: (_) =>
                                    loginController.updateEmail(_),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.call_outlined,
                                      color: AppColors.primary1,
                                    ),
                                    hintText: "Enter Contact number",
                                    // labelText: "Contact number",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors
                                              .primary1), //<-- SEE HERE
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors
                                              .primary1), //<-- SEE HERE
                                    ),
                                    errorText:
                                        forgotController.emailError.value == ""
                                            ? null
                                            : forgotController.emailError.value,
                                    labelStyle:
                                        TextStyle(color: AppColors.black)),
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    child: Text(
                                      'Back to signin',
                                      style: AppTextStyle().subtitle1,
                                    ),
                                    onPressed: () {
                                      stateChangeController.changeIndex(0);
                                    },
                                  )
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.08,
                              ),
                              AppButton(
                                  isExpanded: true,
                                  text: 'Send',
                                  textColor: AppColors.white,
                                  btnColor: AppColors.primary1,
                                  onClick: () {
                                    if (_formKeyForgot.currentState!
                                        .validate()) {
                                      forgotController.sendOtp();
                                    }
                                  })
                            ],
                          )),
                ),
              );
            }),
      ),
    );
  }
}
