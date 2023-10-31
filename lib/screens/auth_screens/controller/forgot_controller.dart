import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport/api/api_url.dart';
import 'package:transport/screens/auth_screens/controller/login_controller.dart';
import 'package:transport/screens/auth_screens/controller/state_change.dart';
import 'package:transport/screens/auth_screens/model/login_model.dart';
import '../../../api/api_service.dart';
import '../../../constants/colors.dart';
import '../../../constants/store_local.dart';
import '../auth_service/service_login.dart';

class ForgotController extends GetxController {
  RxBool isForgot = false.obs;
  RxString emailError = ''.obs;
  RxString otpError = ''.obs;
  RxString otp = ''.obs;

  void updateErrorEmail(String newEmail) {
    emailError.value = newEmail;
  }

  void otpErrorEmail(String newOtp) {
    otpError.value = newOtp;
  }

  void updateOtp(String newOtp) {
    otp.value = newOtp;
  }

  LoginController loginController = Get.put(LoginController());
  StateChangeController stateChangeController =
      Get.put(StateChangeController());
  Future<void> sendOtp() async {
    try {
      isForgot.value = true;
      updateErrorEmail("");
      var body = jsonEncode({"username": loginController.email.value});
      var response = await ApiService()
          .postAuthService(url: ApiUrl.sendOtpUrl, body: body);
      LoginModel apiResponse = LoginModel.fromJson(response);
      if (apiResponse.error != null) {
        responseError(apiResponse.error!);
      } else if (apiResponse.status == true) {
        stateChangeController.changeIndex(2);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString(), colorText: AppColors.white);
    } finally {
      update();
      isForgot.value = false;
    }
  }

  RxBool isVerify = false.obs;
  Future<void> verifyOtp() async {
    try {
      isVerify.value = true;
      otpError.value = "";
      var body = jsonEncode(
          {"username": loginController.email.value, "one_time_pin": otp.value});
      print(body);
      var response = await ApiService()
          .postAuthService(url: ApiUrl.verifyOtpUrl, body: body);
      LoginModel apiResponse = LoginModel.fromJson(response);
      if (apiResponse.status == true) {
        stateChangeController.changeIndex(3);
      } else if (apiResponse.status == false) {
        otpError.value = apiResponse.message.toString();
        Get.snackbar(apiResponse.message.toString(),
            "Check OTP on your email or phone number",
            colorText: AppColors.white);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString(), colorText: AppColors.white);
    } finally {
      update();
      isVerify.value = false;
    }
  }

  responseError(Error error) {
    if (error.username != null) {
      emailError.value = error.username?.first ?? "";
    }
  }
}
