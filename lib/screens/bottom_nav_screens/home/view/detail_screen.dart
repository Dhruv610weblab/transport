import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport/screens/bottom_nav_screens/home/model/routes_model.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/format_date.dart';
import '../../../../constants/text_style.dart';
import '../../../../widgets/page_background.dart';

class DetailScreen extends StatelessWidget {
  final Routes detial;
  const DetailScreen({super.key, required this.detial});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary2,
      body: ScreenBackground(
          isBack: true,
          isAction: false,
          title: 'Detail',
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.white),
                child: ListView(
                  children: [
                    Text(
                      "Trip ID",
                      style: AppTextStyle().subtitle3,
                    ),
                    Text("# ${detial.id}"),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "From",
                                style: AppTextStyle().subtitle3,
                              ),
                              Text(
                                "${detial.pickupAdd1}, ${detial.pickupCity}, ${detial.pickupState}, ${detial.pickupCountry}, (${detial.pickupZip}",
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "To",
                                style: AppTextStyle().subtitle3,
                              ),
                              Text(
                                  "${detial.shipAdd1}, ${detial.shipCity}, ${detial.shipState}, ${detial.shipCountry}, (${detial.shipZip}"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vendor Number",
                                style: AppTextStyle().subtitle3,
                              ),
                              Text("${detial.pickupPhone}"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Receiver Number",
                                style: AppTextStyle().subtitle3,
                              ),
                              Text("${detial.shipPhone}"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Status",
                                style: AppTextStyle().subtitle3,
                              ),
                              Text("${detial.status}"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Weight",
                                style: AppTextStyle().subtitle3,
                              ),
                              Text("${detial.loadQuantity} ${detial.loadUnit}"),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pickup Date",
                                style: AppTextStyle().subtitle3,
                              ),
                              Text("${formatDate(detial.pickupDate)}"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delivery Date",
                                style: AppTextStyle().subtitle3,
                              ),
                              Text("${formatDate(detial.shipDate)}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: Get.height * 0.02,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           "License Number",
                    //           style: AppTextStyle().subtitle3,
                    //         ),
                    //         Text("U5146-317118-09374"),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: Get.height * 0.02,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           "Permanent Address",
                    //           style: AppTextStyle().subtitle3,
                    //         ),
                    //         Text("Kohinoor Chowk, Jaranwala Road"),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                  ],
                )),
          )),
    );
  }
}
