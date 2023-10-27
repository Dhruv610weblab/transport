import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:transport/constants/validators.dart';
import 'package:transport/screens/auth_screens/view/login.dart';
import 'package:transport/screens/get_start.dart';
import '../../../constants/colors.dart';
import '../../../constants/text_style.dart';
import '../../../widgets/button.dart';
import '../../../widgets/loading.dart';
import '../../bottom_nav.dart';
import '../controller/new_pass_controller.dart';
import '../controller/state_change.dart';

class NewPasswordWidget extends StatelessWidget {
  final StateChangeController stateChangeController;
  NewPasswordWidget(this.stateChangeController);
  final _formKeyPassword = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(58), topRight: Radius.circular(58))),
        child: GetBuilder(
            init: NewPasswordController(),
            builder: (newPasswordController) {
              return Form(
                key: _formKeyPassword,
                child: Obx(
                  () => newPasswordController.isNewPass.value == true
                      ? LoadingWidget(title: "Updating Password...")
                      : Container(
                          padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
                          child: ListView(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "New Password",
                                style: AppTextStyle().heading2,
                              ),
                              SizedBox(height: Get.height * 0.04),
                              TextFormField(
                                cursorColor: AppColors.primary1,
                                validator: Validators.notEmpty,
                                // controller: this._emailController,
                                onChanged: (_) =>
                                    newPasswordController.updatePassword(_),
                                decoration: InputDecoration(
                                    hintText: "Enter New Password",
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
                                    labelStyle:
                                        TextStyle(color: AppColors.black)),
                              ),
                              SizedBox(height: Get.height * 0.02),
                              TextFormField(
                                cursorColor: AppColors.primary1,
                                validator: Validators.notEmpty,
                                onChanged: (_) =>
                                    newPasswordController.updateCnfPassword(_),
                                decoration: InputDecoration(
                                    hintText: "Confirm Password",
                                    // labelText: "Contact number",
                                    errorText: newPasswordController
                                                .passwordError.value ==
                                            ""
                                        ? null
                                        : newPasswordController
                                            .passwordError.value,
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
                                    labelStyle:
                                        TextStyle(color: AppColors.black)),
                              ),
                              SizedBox(height: Get.height * 0.08),
                              AppButton(
                                  isExpanded: true,
                                  text: 'Submit',
                                  textColor: AppColors.white,
                                  btnColor: AppColors.primary1,
                                  onClick: () {
                                    if (_formKeyPassword.currentState!
                                        .validate()) {
                                      if (newPasswordController
                                              .password.value !=
                                          newPasswordController
                                              .cnfPassword.value) {
                                        newPasswordController.errorPassword(
                                            "Password doesn't match");
                                      } else {
                                        newPasswordController.setPassword();
                                      }
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
