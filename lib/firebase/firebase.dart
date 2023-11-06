import 'dart:convert';

import 'package:get/get.dart';
import 'package:transport/firebase/service.dart';

import '../api/api_service.dart';
import '../api/api_url.dart';
import '../constants/colors.dart';
import 'model/firebase_model.dart';

class FirebaseController extends GetxController {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final fcmToken = ''.obs;

  Future<void> postToken() async {
    try {
      var body = jsonEncode({'ftoken': fcmToken.value});
      var apiResponse =
          await ApiService().postService(url: ApiUrl.fcmTokenUrl, body: body);
      FireTokenModel fireTokenModel = FireTokenModel.fromJson(apiResponse);
      if (fireTokenModel.success == true) {
        fireTokenModel;
        print("FCM Updated");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString(), colorText: AppColors.white);
    } finally {}
  }

  @override
  void onInit() {
    super.onInit();
  }

  RxInt currentIndex = 0.obs;
  setCurrentIndex({required int value}) {
    currentIndex.value = value;
    update();
  }
}
