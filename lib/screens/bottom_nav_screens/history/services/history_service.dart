// import 'package:get/get.dart';
//
// import '../../../../constants/exception_handle.dart';
// import '../../../../constants/store_local.dart';
// import '../../../auth_screens/controller/login_controller.dart';
//
// class HistoryService extends GetConnect {
//   LoginController loginController = Get.put(LoginController());
//   final HandleException handleException = HandleException();
//
//   Future<dynamic> getService({required String url}) async {
//     try {
//       // LeavesType userToken;
//       final response = await get(url, headers: {
//         "Authorization": 'Bearer ${AppStorage().getToken()}',
//         "Content-Type": "application/json",
//         "Accept": "application/json"
//       });
//       return handleException.returnResponse(response: response);
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
