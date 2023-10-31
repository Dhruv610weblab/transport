import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../constants/colors.dart';
import '../controller/image_controller.dart';

Future<dynamic> imagePickerBottomSheet({bool? isRequestLeave = false}) {
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  return Get.bottomSheet(
    barrierColor: Colors.transparent,
    isScrollControlled: true,
    ignoreSafeArea: false,
    backgroundColor: Colors.transparent,
    Container(
      height: Get.height * 0.28,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: Get.height * 0.12,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // alignment: WrapAlignment.center,
                  // direction: Axis.vertical,
                  // verticalDirection: VerticalDirection.down,
                  // crossAxisAlignment:
                  //     WrapCrossAlignment.center,
                  children: <Widget>[
                    TextButton(
                      child: Text('Take Photo'),
                      onPressed: () {
                        imagePickerController.pickImage(ImageSource.camera);
                        Get.back();
                      },
                    ),
                    Divider(
                      indent: 0,
                      endIndent: 0,
                      thickness: 1,
                      color: AppColors.grey,
                      height: 1,
                    ),
                    TextButton(
                      child: Text(
                        'Choose Photo',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      onPressed: () {
                        imagePickerController.pickImage(ImageSource.gallery);
                        Get.back();
                      },
                    ),
                    // isRequestLeave == true
                    //     ? Container()
                    //     : Divider(
                    //         indent: 0,
                    //         endIndent: 0,
                    //         thickness: 1,
                    //         color: AppColors.grey,
                    //         height: 1,
                    //       ),
                    // isRequestLeave == true
                    //     ? Container()
                    //     : TextButton(
                    //         child: Text(
                    //           'Delete Photo',
                    //           style: TextStyle(color: Colors.red),
                    //         ),
                    //         onPressed: () {
                    //           // imagePickerController.deleteImage();
                    //           Get.back();
                    //         },
                    //       ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Container(
                height: Get.height * 0.12,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // alignment: WrapAlignment.center,
                  // direction: Axis.vertical,
                  // verticalDirection: VerticalDirection.down,
                  // crossAxisAlignment:
                  //     WrapCrossAlignment.center,
                  children: <Widget>[
                    TextButton(
                      child: Text(
                        'Cancel',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ],
          )),
    ),
  );
}
