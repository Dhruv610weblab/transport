import 'package:flutter/material.dart';
import 'package:transport/screens/bottom_nav_screens/profile/controller/image_controller.dart';
import 'package:transport/screens/bottom_nav_screens/profile/widget/photo_pick_bottom_sheet.dart';

import '../../../../constants/colors.dart';

class ProfileImage extends StatelessWidget {
  final bool isEditable;
  const ProfileImage({
    super.key,
    this.isEditable = false,
  });
  @override
  Widget build(BuildContext context) {
    ImagePickerController imagePickerController = ImagePickerController();

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/getstart.png'),
                    fit: BoxFit.cover)),
          ),
        ),
        !isEditable
            ? Container()
            : Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: GestureDetector(
                      onTap: () {
                        imagePickerBottomSheet();
                      },
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppColors.primary1),
                        child: Icon(
                          Icons.camera_alt,
                          color: AppColors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              )
      ],
    );
  }
}
