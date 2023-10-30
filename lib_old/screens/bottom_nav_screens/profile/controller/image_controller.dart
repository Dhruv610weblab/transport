import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerController extends GetxController {
  File? _image;
  File? get image => _image;

  Future<bool> requestPermission(Permission permission) async {
    final status = await permission.request();
    return status.isGranted;
  }

  Future<void> pickImage(ImageSource source) async {
    bool isPermissionGranted;
    if (source == ImageSource.camera) {
      isPermissionGranted = await requestPermission(Permission.camera);
      isPermissionGranted = await requestPermission(Permission.storage);
    } else {
      isPermissionGranted = await requestPermission(Permission.photos);
      isPermissionGranted = await requestPermission(Permission.storage);
    }

    if (isPermissionGranted) {
      try {
        final pickedImage = await ImagePicker().pickImage(source: source);
        if (pickedImage == null) return;
        _image = File(pickedImage.path);
        //
        // var request =
        //     http.MultipartRequest('post', Uri.parse(ApiUrl.profileImageUrl));
        // request.headers["Authorization"] = 'Bearer ${AppStorage().getToken()}';
        // request.headers["Content-Type"] = 'multipart/form-data';
        // request.headers["Accept"] = 'application/json';
        // if (image != null) {
        //   request.files.add(http.MultipartFile(
        //     'profile_image',
        //     image!.readAsBytes().asStream(),
        //     image!.lengthSync(),
        //     filename: image!.path.split('/').last,
        //   ));
        // }
        // final response = await request.send();
        // print('Image upload ${response.statusCode}');
        // // print('Image uploa ${response.message}');
        // final responseData = await response.stream.bytesToString();
        // final jsonResponse = jsonDecode(responseData);
        // //
        // RequestLeaveResponse apiResponse =
        //     RequestLeaveResponse.fromJson(jsonResponse);
        // if (response.statusCode == 200) {
        // Request succeeded, handle the response data
        // print("SUCCESS ${apiResponse.message}");
        // update();
        // ProfileController profileController = Get.put(ProfileController());
        // profileController.profileHome();
        // Get.back();

        // Get.snackbar('Success', "${apiResponse.message}",
        //     colorText: AppColors.white);
        // } else if (response.statusCode == 401) {
        //   defaultLogoutDialog('Unauthorised');
        // }
        // Notify GetX that the state has changed

        // // Crop the picked image
        // final croppedImage = await ImageCropper().cropImage(
        //     sourcePath: pickedImage.path,
        //     aspectRatio: CropAspectRatio(
        //         ratioX: 1.0, ratioY: 1.0), // Set aspect ratio to a square
        //     compressQuality: 100,
        //     uiSettings: [
        //       AndroidUiSettings(
        //           toolbarTitle: 'Cropper',
        //           toolbarColor: Colors.deepOrange,
        //           toolbarWidgetColor: Colors.white,
        //           initAspectRatio: CropAspectRatioPreset.original,
        //           lockAspectRatio: false),
        //       IOSUiSettings(
        //         title: 'Cropper',
        //       ), // Adjust the quality of the cropped image
        //     ]);
        // if (croppedImage == null) return;
        //
        // _image = File(croppedImage.path);
        // update();
      } catch (e) {
        print("Error picking image: $e");
      }
    } else {
      if (source == ImageSource.camera) {
        print("Camera permission denied.");
      } else {
        print("Photo library permission denied.");
      }
    }
  }
}
