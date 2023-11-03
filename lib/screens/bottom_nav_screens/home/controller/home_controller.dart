import 'dart:convert';

import 'package:get/get.dart';
import 'package:transport/constants/store_local.dart';
import 'package:transport/screens/bottom_nav_screens/home/model/routes_model.dart';
import 'package:transport/screens/bottom_nav_screens/home/model/update_status_model.dart';
import '../../../../api/api_service.dart';
import '../../../../api/api_url.dart';
import '../../../../constants/colors.dart';

class RouteController extends GetxController {
  RxBool isHome = false.obs;
  // Rx<Data?> routesData = Rx<Data?>(null);
  RxList<Routes> routesList = <Routes>[].obs;

  Future<void> routes() async {
    try {
      isHome.value = true;
      routesList.removeRange(0, routesList.length);
      var response = await ApiService().getService(url: ApiUrl.routesUrl);
      RoutesModel apiResponse = RoutesModel.fromJson(response);
      if (apiResponse.status == true) {
        if (apiResponse.data != null) {
          routesList.assignAll(apiResponse.data?.routes ?? []);
        }
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString().split(":").last,
          colorText: AppColors.white);
    } finally {
      update();
      isHome.value = false;
    }
  }

  RxBool isStatus = false.obs;
  Future<void> status({required int status, required int id}) async {
    try {
      isStatus.value = true;
      var body = jsonEncode({"id": id, "status": status});
      // print(AppStorage().getToken());
      var response = await ApiService()
          .postService(body: body, url: ApiUrl.updateStatusUrl);
      UpdateStatusModel apiResponse = UpdateStatusModel.fromJson(response);
      if (apiResponse.status == true) {
        routes();
        Get.snackbar("Success", apiResponse.message.toString(),
            colorText: AppColors.white);
      } else {
        Get.snackbar("Failed", apiResponse.message.toString(),
            colorText: AppColors.white);
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString().split(":").last,
          colorText: AppColors.white);
    } finally {
      update();
      isStatus.value = false;
    }
  }
}
