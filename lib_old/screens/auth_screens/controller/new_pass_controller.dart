import 'dart:convert';

import 'package:get/get.dart';
import 'package:transport/constants/store_local.dart';
import 'package:transport/screens/auth_screens/controller/login_controller.dart';
import 'package:transport/screens/auth_screens/controller/state_change.dart';

import '../../../api/api_url.dart';
import '../../../constants/colors.dart';
import '../auth_service/service_login.dart';
import '../model/login_model.dart';
import '../view/login.dart';

class NewPasswordController extends GetxController {
  RxBool isNewPass = false.obs;
  RxString passwordError = ''.obs;
  RxString password = ''.obs;
  RxString cnfPassword = ''.obs;

  void updatePassword(String newPassword) {
    password.value = newPassword;
  }

  void updateCnfPassword(String newPassword) {
    cnfPassword.value = newPassword;
  }

  void errorPassword(String newPassword) {
    passwordError.value = newPassword;
    update();
  }

  LoginController loginController = Get.put(LoginController());
  StateChangeController stateChangeController =
      Get.put(StateChangeController());
  Future<void> setPassword() async {
    try {
      isNewPass.value = true;
      passwordError.value = "";
      var body = jsonEncode({
        "username": loginController.email.value,
        "password": password.value
      });
      var response = await LoginService()
          .postService(url: ApiUrl.newPasswordUrl, body: body);
      LoginModel apiResponse = LoginModel.fromJson(response);
      if (apiResponse.status == true) {
        stateChangeController.changeIndex(0);
        Get.offAll(() => LoginScreen());
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString(), colorText: AppColors.white);
    } finally {
      update();
      isNewPass.value = false;
    }
  }
}
