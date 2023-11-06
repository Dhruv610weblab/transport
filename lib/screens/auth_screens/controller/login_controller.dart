import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport/api/api_url.dart';
import 'package:transport/screens/auth_screens/model/login_model.dart';
import '../../../api/api_service.dart';
import '../../../constants/colors.dart';
import '../../../constants/store_local.dart';
import '../../../firebase/firebase.dart';
import '../../get_start.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;

  void updateEmail(String newEmail) {
    email.value = newEmail;
  }

  void updatePassword(String newPassword) {
    password.value = newPassword;
  }

  void updateErrorEmail(String newEmail) {
    emailError.value = newEmail;
  }

  void updateErrorPassword(String newPassword) {
    passwordError.value = newPassword;
  }

  FirebaseController firebaseController = Get.put(FirebaseController());

  Future<void> loginUser(GlobalKey<FormState> formKeyLogin) async {
    try {
      isLoading.value = true;
      updateErrorEmail("");
      updateErrorPassword("");
      if (formKeyLogin.currentState!.validate()) {
        var body =
            jsonEncode({"username": email.value, "password": password.value});
        var response = await ApiService()
            .postAuthService(url: ApiUrl.loginUrl, body: body);
        LoginModel apiResponse = LoginModel.fromJson(response);
        if (apiResponse.error != null) {
          responseError(apiResponse.error!);
        } else if (apiResponse.data != null) {
          await AppStorage().saveToken(apiResponse.data!.token.toString());
          await AppStorage().saveUserName(email.value);
          await firebaseController.postToken();
          Get.offAll(() => const GetStartedScreen());
        }
      }
    } on SocketException {
      Get.snackbar("Network", 'No internet connection',
          colorText: AppColors.white);
    } catch (e) {
      Get.snackbar("Exception", e.toString().split(":").last,
          colorText: AppColors.white);
    } finally {
      update();
      isLoading.value = false;
    }
  }

  responseError(Error error) {
    if (error.username != null) {
      emailError.value = error.username?.first ?? "";
    }
    if (error.password != null) {
      passwordError.value = error.password?.first ?? "";
    }
  }
}
