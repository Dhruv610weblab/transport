import 'package:get/get.dart';

import '../../../api/api_url.dart';
import '../../../constants/exception_handle.dart';
import '../../../constants/store_local.dart';
import '../controller/login_controller.dart';

class LoginService extends GetConnect {
  LoginController loginController = Get.put(LoginController());
  final HandleException handleException = HandleException();

  Future<dynamic> postService(
      {required String url, required String body}) async {
    try {
      // LeavesType userToken;
      final response = await post(url, body, headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      });
      return handleException.returnResponse(response: response);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getService({required String url}) async {
    try {
      // LeavesType userToken;
      final response = await get(url, headers: {
        "Authorization": 'Bearer ${AppStorage().getToken()}',
        "Content-Type": "application/json",
        "Accept": "application/json"
      });
      return handleException.returnResponse(response: response);
    } catch (e) {
      rethrow;
    }
  }
}
