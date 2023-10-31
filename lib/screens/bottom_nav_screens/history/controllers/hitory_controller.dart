import 'package:get/get.dart';
import 'package:transport/screens/bottom_nav_screens/history/model/history_model.dart';

import '../../../../api/api_service.dart';
import '../../../../api/api_url.dart';
import '../../../../constants/colors.dart';

class HistoryController extends GetxController {
  RxBool isHistory = false.obs;
  Rx<Data?> historyData = Rx<Data?>(null);
  RxList<Routes> historyList = <Routes>[].obs;

  Future<void> history() async {
    try {
      isHistory.value = true;
      historyList.removeRange(0, historyList.length);
      var response = await ApiService().getService(url: ApiUrl.historyUrl);
      HistoryModel apiResponse = HistoryModel.fromJson(response);
      if (apiResponse.status == true) {
        if (apiResponse.data != null) {
          historyList.assignAll(apiResponse.data?.routes ?? []);
        }
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString().split(":").last,
          colorText: AppColors.white);
    } finally {
      update();
      isHistory.value = false;
    }
  }
}
