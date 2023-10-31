import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';

import '../constants/exception_handle.dart';
import '../constants/store_local.dart';
import '../screens/auth_screens/controller/login_controller.dart';

class ApiService extends GetConnect {
  LoginController loginController = Get.put(LoginController());
  final HandleException handleException = HandleException();

  Future<dynamic> postAuthService(
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

  Future<dynamic> postService(
      {required String url, required String body}) async {
    try {
      // LeavesType userToken;
      final response = await post(url, body, headers: {
        "Authorization": 'Bearer ${AppStorage().getToken()}',
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
