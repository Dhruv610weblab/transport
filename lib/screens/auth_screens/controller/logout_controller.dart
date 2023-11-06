import 'package:get/get.dart';
import 'package:transport/screens/auth_screens/view/login.dart';

import '../../../api/api_service.dart';
import '../../../api/api_url.dart';
import '../../../constants/colors.dart';
import '../../../constants/store_local.dart';
import '../model/login_model.dart';

class LogoutController extends GetxController {
  RxBool isLogout = false.obs;
  Future<void> logoutUser() async {
    try {
      isLogout.value = true;
      var response = await ApiService().getService(url: ApiUrl.logoutUrl);
      LoginModel apiResponse = LoginModel.fromJson(response);
      if (apiResponse.status == true) {
        Get.snackbar("Logout", apiResponse.message.toString(),
            colorText: AppColors.white);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString().split(":").last,
          colorText: AppColors.white);
    } finally {
      AppStorage().removeToken();
      Get.offAll(() => const LoginScreen());
      isLogout.value = false;
    }
  }
}
