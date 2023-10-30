import 'package:get/get.dart';
import '../constants/colors.dart';
import '../constants/store_local.dart';
import '../screens/auth_screens/controller/login_controller.dart';
import '../screens/auth_screens/controller/logout_controller.dart';
import '../screens/auth_screens/view/login.dart';

Future<dynamic> defaultLogoutDialog(Object e) {
  LogoutController logoutController = Get.put(LogoutController());

  return Get.defaultDialog(
      title: "$e".split(":").last,
      barrierDismissible:
          false, // Set this to false to make the dialog not dismissible from outside touch
      middleText:
          "You have logged in with a different device. Please login again",
      onConfirm: () {
        logoutController.logoutUser().then((value) =>
            AppStorage().getToken() != null
                ? null
                : Get.offAll(() => LoginScreen()));
      },
      backgroundColor: AppColors.white,
      buttonColor: AppColors.primary2,
      radius: 30);
}
