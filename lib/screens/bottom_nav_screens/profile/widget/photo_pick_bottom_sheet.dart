import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants/colors.dart';
import '../controller/image_controller.dart';

Future<dynamic> imagePickerBottomSheet({bool? isRequestLeave = false}) {
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  return Get.bottomSheet(
    isScrollControlled: false,
    ignoreSafeArea: false,
    backgroundColor: Colors.transparent,
    OrientationBuilder(builder: (context, orientation) {
      bool isPortrait = orientation == Orientation.portrait;
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: isPortrait ? 8.0 : 150),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: isPortrait
                  ? isRequestLeave == true
                      ? Get.height * 0.12
                      : Get.height * 0.18
                  : isRequestLeave == true
                      ? Get.height * 0.28
                      : Get.height * 0.4,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
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
                  isRequestLeave == true
                      ? Container()
                      : Divider(
                          indent: 0,
                          endIndent: 0,
                          thickness: 1,
                          color: AppColors.grey,
                          height: 1,
                        ),
                  isRequestLeave == true
                      ? Container()
                      : TextButton(
                          child: Text(
                            'Delete Photo',
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () {
                            // imagePickerController.deleteImage();
                            Get.back();
                          },
                        ),
                ],
              ),
            ),
            SizedBox(
              height: isPortrait ? Get.height * 0.02 : Get.height * 0.01,
            ),
            Container(
              height: (isPortrait ? Get.height * 0.18 : Get.height * 0.4) / 3,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(8)),
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
            SizedBox(
              height: isPortrait ? Get.height * 0.06 : Get.height / 6,
            ),
          ],
        ),
      );
    }),
  );
}
