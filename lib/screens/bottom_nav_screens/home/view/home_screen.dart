import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport/constants/colors.dart';
import 'package:transport/screens/bottom_nav_screens/home/controller/home_controller.dart';
import 'package:transport/screens/bottom_nav_screens/home/view/detail_screen.dart';
import 'package:transport/widgets/button.dart';
import 'package:transport/widgets/page_background.dart';

import '../../../../constants/text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary2,
      body: ScreenBackground(
          title: 'Request',
          child: GetBuilder(
              init: RouteController(),
              builder: (routeController) {
                if (routeController.isHome.value) {
                  return Center(child: CircularProgressIndicator());
                }

                return RefreshIndicator(
                  onRefresh: () => routeController.routes(),
                  child: ListView.builder(
                      // shrinkWrap: true,
                      itemCount: routeController.routesList.isEmpty
                          ? 1
                          : routeController.routesList.length,
                      itemBuilder: (context, index) {
                        if (routeController.routesList.isEmpty) {
                          return SizedBox(
                            height: Get.height / 2,
                            child: Center(
                              child: Text(
                                "Trip not found",
                                style: AppTextStyle().subtitle6,
                              ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Trip ID",
                                        style: AppTextStyle().subtitle3,
                                      ),
                                      IconButton(
                                          onPressed: () => Get.to(() =>
                                              DetailScreen(
                                                  detial: routeController
                                                      .routesList[index])),
                                          icon: Icon(
                                            Icons.info_outline,
                                            color: AppColors.primary1,
                                          ))
                                    ],
                                  ),
                                  Text(
                                      "#${routeController.routesList[index].routesId}"),
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
                                              "${routeController.routesList[index].pickupAdd1}, ${routeController.routesList[index].pickupCity}, ${routeController.routesList[index].pickupState}, ${routeController.routesList[index].pickupCountry}, (${routeController.routesList[index].pickupZip})",
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
                                              "${routeController.routesList[index].shipAdd1}, ${routeController.routesList[index].shipState}, ${routeController.routesList[index].shipState}, ${routeController.routesList[index].shipCountry}, (${routeController.routesList[index].shipZip})",
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
                                          child: AppButton(
                                        height: 35,
                                        padding: 0,
                                        textSize: 15,
                                        text: "Accept",
                                        textColor: AppColors.white,
                                        btnColor: AppColors.green,
                                        onClick: () async =>
                                            await routeController.status(
                                                id: routeController
                                                        .routesList[index].id ??
                                                    0,
                                                status: 0),
                                      )),
                                      SizedBox(
                                        width: Get.width * 0.12,
                                      ),
                                      Expanded(
                                          child: AppButton(
                                              height: 35,
                                              padding: 0,
                                              textSize: 15,
                                              text: "Reject",
                                              textColor: AppColors.white,
                                              btnColor: AppColors.red,
                                              onClick: () async =>
                                                  await routeController.status(
                                                      id: routeController
                                                              .routesList[index]
                                                              .id ??
                                                          0,
                                                      status: 1))),
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
