import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport/constants/text_style.dart';
import 'package:transport/screens/bottom_nav_screens/ongoing/controllers/view_controller.dart';
import 'package:transport/screens/bottom_nav_screens/ongoing/view/verify_shipping.dart';
import 'package:transport/widgets/button.dart';

import '../../../../constants/colors.dart';
import '../../../../widgets/page_background.dart';

class OnGoingScreen extends StatelessWidget {
  const OnGoingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary2,
      body: ScreenBackground(
          title: 'View  Trips',
          child: GetBuilder(
              init: ViewController(),
              builder: (viewController) {
                if (viewController.isView.value) {
                  return Center(child: CircularProgressIndicator());
                }
                return RefreshIndicator(
                  onRefresh: () => viewController.viewRoutes(),
                  child: ListView.builder(
                      // shrinkWrap: true,
                      itemCount: viewController.viewList.isEmpty
                          ? 1
                          : viewController.viewList.length,
                      itemBuilder: (context, index) {
                        if (viewController.viewList.isEmpty) {
                          return Center(
                            child: Text(
                              "Currently no trip found",
                              style: AppTextStyle().subtitle6,
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              padding: EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Track number",
                                              style: AppTextStyle().subtitle3,
                                            ),
                                            Text(
                                                "# ${viewController.viewList[index].id}"),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Status",
                                              style: AppTextStyle().subtitle3,
                                            ),
                                            Text(
                                              "Processing",
                                              style: AppTextStyle().subtitle4,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Text(
                                  //   "Track number",
                                  //   style: AppTextStyle().subtitle3,
                                  // ),
                                  // Text("ID 2351 6534"),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "From",
                                              style: AppTextStyle().subtitle3,
                                            ),
                                            Text(
                                              "${viewController.viewList[index].pickupAdd1}, ${viewController.viewList[index].pickupCity}, ${viewController.viewList[index].pickupState}, ${viewController.viewList[index].pickupCountry}, (${viewController.viewList[index].pickupZip})",
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "To",
                                              style: AppTextStyle().subtitle3,
                                            ),
                                            Text(
                                              "${viewController.viewList[index].shipAdd1}, ${viewController.viewList[index].shipCity}, ${viewController.viewList[index].shipState}, ${viewController.viewList[index].shipCountry}, (${viewController.viewList[index].shipZip})",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Weight",
                                              style: AppTextStyle().subtitle3,
                                            ),
                                            Text(
                                                "${viewController.viewList[index].loadQuantity} ${viewController.viewList[index].loadUnit}"),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Obx(
                                              () => viewController.isView.value
                                                  ? Container()
                                                  : AppButton(
                                                      height: 35,
                                                      padding: 1,
                                                      textSize: 14,
                                                      text: viewController
                                                                      .sendingOtp[
                                                                  index] ==
                                                              true
                                                          ? "Sending otp"
                                                          : "Complete",
                                                      textColor:
                                                          AppColors.white,
                                                      btnColor: viewController
                                                                      .sendingOtp[
                                                                  index] ==
                                                              true
                                                          ? AppColors.grey
                                                          : AppColors.green,
                                                      onClick: () async {
                                                        viewController
                                                                .routeId.value =
                                                            viewController
                                                                    .viewList[
                                                                        index]
                                                                    .id ??
                                                                0;
                                                        await viewController
                                                            .sendOtp(
                                                                index: index);
                                                        if (viewController
                                                                .isOtpSend
                                                                .value ==
                                                            true) {
                                                          Get.bottomSheet(
                                                              VerifyShippingOtp(
                                                                  index: index),
                                                              isDismissible:
                                                                  false,
                                                              backgroundColor:
                                                                  AppColors
                                                                      .white);

                                                          // Get.to(() =>
                                                          //     VerifyShippingOtp());
                                                        }
                                                      }),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        );
                      }),
                );
              })),
    );
  }
}
