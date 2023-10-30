import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport/constants/validators.dart';
import 'package:transport/screens/auth_screens/controller/login_controller.dart';
import '../../../constants/colors.dart';
import '../../../constants/text_style.dart';
import '../../../widgets/button.dart';
import '../../../widgets/loading.dart';
import '../controller/state_change.dart';

class LoginWidget extends StatelessWidget {
  final StateChangeController stateChangeController;
  LoginWidget(this.stateChangeController);
  LoginController loginController = Get.put(LoginController());
  final _formKeyLogin = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(58), topRight: Radius.circular(58))),
        child: GetBuilder(
            init: LoginController(),
            builder: (loginController) {
              return Form(
                key: _formKeyLogin,
                child: Obx(
                  () => loginController.isLoading.value == true
                      ? LoadingWidget(title: 'Please wait...')
                      : Container(
                          padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
                          child: ListView(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome back Shiva!",
                                style: AppTextStyle().heading2,
                              ),
                              SizedBox(height: Get.height * 0.04),
                              TextFormField(
                                validator: Validators.notEmpty,
                                cursorColor: AppColors.primary1,
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
                                        loginController.emailError.value == ""
                                            ? null
                                            : loginController.emailError.value,
                                    labelStyle:
                                        TextStyle(color: AppColors.black)),
                              ),
                              SizedBox(height: Get.height * 0.02),
                              TextFormField(
                                cursorColor: AppColors.primary1,
                                validator: Validators.notEmpty,
                                onChanged: (_) =>
                                    loginController.updatePassword(_),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      color: AppColors.primary1,
                                    ),
                                    hintText: "Enter your password",
                                    // labelText: "Enter your password",
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors
                                              .primary1), //<-- SEE HERE
                                    ),
                                    errorText: loginController
                                                .passwordError.value ==
                                            ""
                                        ? null
                                        : loginController.passwordError.value,
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors
                                              .primary1), //<-- SEE HERE
                                    ),
                                    labelStyle:
                                        TextStyle(color: AppColors.black)),
                              ),
                              SizedBox(height: Get.height * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    child: Text(
                                      'Forgot Password?',
                                      style: AppTextStyle().subtitle1,
                                    ),
                                    onPressed: () {
                                      stateChangeController.changeIndex(1);
                                    },
                                  )
                                ],
                              ),
                              SizedBox(height: Get.height * 0.08),
                              AppButton(
                                isExpanded: true,
                                text: 'Login',
                                textColor: AppColors.white,
                                btnColor: AppColors.primary1,
                                onClick: () async => await loginController
                                    .loginUser(_formKeyLogin),
                              )
                            ],
                          )),
                ),
              );
            }),
      ),
    );
  }
}
