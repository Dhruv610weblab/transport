// import 'package:get/get.dart';
// import '../constants/exception_handle.dart';
// import '../constants/store_local.dart';
// import 'model/firebase_model.dart';
//
// class ApiServices extends GetConnect {
//   HandleException handleException = HandleException();
//
//   ///Post Firebase Token
//   Future<FireTokenModel> postFireToken(String body) async {
//     try {
//       final response =
//           await post(ApiUrl.updateFirebaseTokenUrl, body, headers: {
//         "Authorization": "Bearer ${AppStorage().getToken()}",
//         "Content-Type": "application/json",
//         "Accept": "application/json"
//       });
//       print(response.body);
//       var apiResponse =
//           await handleException.returnResponse(response: response);
//       FireTokenModel fireTokenModel = FireTokenModel.fromJson(apiResponse);
//       if (fireTokenModel.success == true) {
//         return fireTokenModel;
//       }
//
//       return FireTokenModel();
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
