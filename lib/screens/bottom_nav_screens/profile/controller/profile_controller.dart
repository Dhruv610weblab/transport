import 'package:get/get.dart';
import 'package:transport/screens/auth_screens/model/profile_model.dart';
import 'package:transport/screens/bottom_nav_screens/profile/service/profile_service.dart';

import '../../../../api/api_url.dart';
import '../../../../constants/colors.dart';

class ProfileController extends GetxController {
  RxBool isProfile = false.obs;
  Rx<Data?> profileData = Rx<Data?>(null);
  Future<void> getProfile() async {
    try {
      isProfile.value = true;
      var response = await ProfileService().getService(url: ApiUrl.profileUrl);
      ProfileModel apiResponse = ProfileModel.fromJson(response);
      if (apiResponse.status == true) {
        if (apiResponse.data != null) {
          profileData.value = apiResponse.data;
        }
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString(), colorText: AppColors.white);
    } finally {
      update();
      isProfile.value = false;
    }
  }
}
