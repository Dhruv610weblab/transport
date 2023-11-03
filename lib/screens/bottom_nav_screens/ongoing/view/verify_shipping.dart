import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/text_style.dart';
import '../../../../constants/validators.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/loading.dart';
import '../controllers/view_controller.dart';

class VerifyShippingOtp extends StatelessWidget {
  final int index;
  VerifyShippingOtp({super.key, required this.index});
  final _formKeyVerify = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 45,
      height: 45,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.black),
      ),
    );
    return Container(
      width: Get.width,
      child: GetBuilder(
          init: ViewController(),
          builder: (viewController) {
            return Form(
              key: _formKeyVerify,
              child: Obx(
                () => viewController.isVerify.value == true
                    ? LoadingWidget(title: "Verifying OTP...")
                    : Container(
                        padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
                        child: ListView(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Verification",
                              style: AppTextStyle().heading2,
                            ),
                            SizedBox(
                              height: Get.height * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Enter Verification code'),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.02),
                            Directionality(
                              // Specify direction if desired
                              textDirection: TextDirection.ltr,
                              child: Pinput(
                                // controller: pinController,
                                // focusNode: focusNode,
                                androidSmsAutofillMethod:
                                    AndroidSmsAutofillMethod.smsUserConsentApi,
                                listenForMultipleSmsOnAndroid: true,
                                defaultPinTheme: defaultPinTheme,
                                separatorBuilder: (index) =>
                                    const SizedBox(width: 8),
                                validator: Validators.notEmpty,
                                // onClipboardFound: (value) {
                                //   debugPrint('onClipboardFound: $value');
                                //   pinController.setText(value);
                                // },
                                // errorText: forgotController.otpError.value == ""
                                //     ? null
                                //     : forgotController.otpError.value,
                                hapticFeedbackType:
                                    HapticFeedbackType.lightImpact,
                                // onCompleted: (pin) {
                                //   debugPrint('onCompleted: $pin');
                                // },
                                onChanged: (_) => viewController.updateOtp(_),
                                cursor: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 9),
                                      width: 22,
                                      height: 1,
                                      color: AppColors.primary1,
                                    ),
                                  ],
                                ),
                                focusedPinTheme: defaultPinTheme.copyWith(
                                  decoration:
                                      defaultPinTheme.decoration!.copyWith(
                                    borderRadius: BorderRadius.circular(100),
                                    border:
                                        Border.all(color: AppColors.primary1),
                                  ),
                                ),
                                submittedPinTheme: defaultPinTheme.copyWith(
                                  decoration:
                                      defaultPinTheme.decoration!.copyWith(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    border:
                                        Border.all(color: AppColors.primary1),
                                  ),
                                ),
                                errorPinTheme: defaultPinTheme.copyBorderWith(
                                  border: Border.all(color: Colors.redAccent),
                                ),
                              ),
                            ),
                            SizedBox(height: Get.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                viewController.sendingOtp[index] == true
                                    ? Text("Resending OTP...",
                                        style: AppTextStyle().subtitle1)
                                    : RichText(
                                        text: TextSpan(
                                            text:
                                                '''If you didn't receive the code! ''',
                                            style: AppTextStyle().subtitle1,
                                            children: [
                                              TextSpan(
                                                text: '''Resend''',
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () =>
                                                          viewController
                                                              .sendOtp(
                                                                  index: index),
                                                style: AppTextStyle().subtitle2,
                                              )
                                            ])),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  child: Text(
                                    'Cancel',
                                    style: AppTextStyle().subtitle1,
                                  ),
                                  onPressed: () {
                                    Get.back();
                                    // stateChangeController.changeIndex(0);
                                  },
                                )
                              ],
                            ),
                            SizedBox(height: Get.height * 0.08),
                            AppButton(
                                isExpanded: true,
                                text: 'Verify',
                                textColor: AppColors.white,
                                btnColor: AppColors.primary1,
                                onClick: () {
                                  if (_formKeyVerify.currentState!.validate()) {
                                    viewController.verifyOtp();
                                  }
                                })
                          ],
                        )),
              ),
            );
          }),
    );
  }
}
