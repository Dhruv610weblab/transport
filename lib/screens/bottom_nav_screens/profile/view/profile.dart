import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport/constants/store_local.dart';
import 'package:transport/screens/auth_screens/controller/logout_controller.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/text_style.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/page_background.dart';
import '../widget/profile_image.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  LogoutController logoutController = Get.put(LogoutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary2,
      body: ScreenBackground(
          title: 'My Profile',
          isAction: false,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.white),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            ProfileImage(),
                            SizedBox(height: Get.height * 0.01),
                            Text("Jack Sullivan",
                                style: AppTextStyle().subtitle3),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Mobile Number",
                                style: AppTextStyle().subtitle3),
                            Text("+91 9878985485"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Date Of Birth",
                                style: AppTextStyle().subtitle3),
                            Text("24-Feb-1991"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("License Number",
                                style: AppTextStyle().subtitle3),
                            Text("U5146-317118-09374"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Permanent Address",
                                style: AppTextStyle().subtitle3),
                            Text("Kohinoor Chowk, Jaranwala Road"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.08),
                    AppButton(
                        isExpanded: true,
                        text: 'Edit',
                        textColor: AppColors.white,
                        btnColor: AppColors.primary1,
                        onClick: () {}),
                    SizedBox(height: Get.height * 0.02),
                    AppButton(
                        isExpanded: true,
                        text: 'Logout',
                        textColor: AppColors.white,
                        btnColor: AppColors.primary1,
                        onClick: () async {
                          await logoutController.logoutUser();
                        })
                  ],
                )),
          )),
    );
  }
}
