import 'dart:convert';
import 'package:get/get.dart';
import 'package:transport/constants/store_local.dart';
import 'package:transport/screens/bottom_nav_screens/home/controller/home_controller.dart';
import 'package:transport/screens/bottom_nav_screens/ongoing/model/view_model.dart'
    as vm;
import '../../../../api/api_service.dart';
import '../../../../api/api_url.dart';
import '../../../../constants/colors.dart';
import '../../../auth_screens/model/login_model.dart';

class ViewController extends GetxController {
  RouteController routeController = Get.put(RouteController());

  RxInt routeId = 0.obs;
  RxBool isView = false.obs;
  // Rx<vm.Data?> viewData = Rx<vm.Data?>(null);
  RxList<vm.Routes> viewList = <vm.Routes>[].obs;
  RxList<bool> sendingOtp = <bool>[].obs;
  Future<void> viewRoutes() async {
    try {
      isView.value = true;
      viewList.removeRange(0, viewList.length);
      sendingOtp.removeRange(0, sendingOtp.length);
      var response = await ApiService().getService(url: ApiUrl.routesUrl);
      vm.ViewModel apiResponse = vm.ViewModel.fromJson(response);
      if (apiResponse.status == true) {
        if (apiResponse.data != null) {
          viewList.assignAll(apiResponse.data?.routes ?? []);
          sendingOtp =
              RxList<bool>.filled(viewList.length, false, growable: true);
        }
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString().split(":").last,
          colorText: AppColors.white);
    } finally {
      update();
      isView.value = false;
    }
  }

  RxBool isOtpSend = false.obs;
  Future<void> sendOtp({required int index}) async {
    try {
      sendingOtp[index] = true;
      isOtpSend.value = false;
      var body = jsonEncode({"id": routeId.value});
      var response =
          await ApiService().postService(url: ApiUrl.checkUrl, body: body);
      LoginModel apiResponse = LoginModel.fromJson(response);
      // if (apiResponse.status == true) {
      //   Get.snackbar("Success", apiResponse.message.toString(),
      //       colorText: AppColors.white);
      // } else {
      isOtpSend.value = apiResponse.status ?? false;
      Get.snackbar("Success", apiResponse.message.toString(),
          colorText: AppColors.white);
      // }
    } catch (e) {
      Get.snackbar("Exception", e.toString(), colorText: AppColors.white);
    } finally {
      sendingOtp[index] = false;
      update();
    }
  }

  RxString otpError = ''.obs;
  RxString otp = ''.obs;
  RxBool isVerify = false.obs;
  void updateOtp(String newOtp) {
    otp.value = newOtp;
  }

  Future<void> verifyOtp() async {
    try {
      isVerify.value = true;
      otpError.value = "";
      var body = jsonEncode({"id": routeId.value, "one_time_pin": otp.value});
      print(AppStorage().getToken());
      var response =
          await ApiService().postService(url: ApiUrl.verifyUrl, body: body);
      LoginModel apiResponse = LoginModel.fromJson(response);
      if (apiResponse.status == true) {
        Get.back();
        routeController.routes();
        // viewRoutes().then((value) async {
        //   await routeController.status(status: 2, id: routeId.value);
        //
        Get.snackbar("Success", apiResponse.message.toString(),
            colorText: AppColors.white);
        // });
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
}
