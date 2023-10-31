import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport/constants/store_local.dart';
import 'package:transport/screens/auth_screens/controller/logout_controller.dart';
import 'package:transport/screens/bottom_nav_screens/profile/controller/profile_controller.dart';

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
            child: GetBuilder(
                init: ProfileController(),
                builder: (profileController) {
                  return Container(
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
                                  ProfileImage(
                                    url: profileController
                                        .profileData.value?.driver?.profile,
                                    isEditable: true,
                                  ),
                                  SizedBox(height: Get.height * 0.01),
                                  Text(
                                      "${profileController.profileData.value?.driver?.firstName} ${profileController.profileData.value?.driver?.lastName}",
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
                                  Text(
                                      "${profileController.profileData.value?.driver?.phone}"),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Date Of Birth",
                                      style: AppTextStyle().subtitle3),
                                  Text(
                                      "${profileController.profileData.value?.driver?.dob}"),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Gender",
                                      style: AppTextStyle().subtitle3),
                                  Text(
                                      "${profileController.profileData.value?.driver?.gender}"
                                          .toUpperCase()),
                                ],
                              ),
                              Container()
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
                                  Text(
                                      "${profileController.profileData.value?.driver?.licenseNo}"),
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
                                  Text(
                                      "${profileController.profileData.value?.driver?.address}"),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: Get.height * 0.08),
                          // AppButton(
                          //     isExpanded: true,
                          //     text: 'Edit',
                          //     textColor: AppColors.white,
                          //     btnColor: AppColors.primary1,
                          //     onClick: () {}),
                          // SizedBox(height: Get.height * 0.02),
                          AppButton(
                              isExpanded: true,
                              text: 'Logout',
                              textColor: AppColors.white,
                              btnColor: AppColors.primary1,
                              onClick: () async {
                                await logoutController.logoutUser();
                              })
                        ],
                      ));
                }),
          )),
    );
  }
}
