import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport/constants/text_style.dart';
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
          child: ListView.builder(
              // shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Track number",
                                      style: AppTextStyle().subtitle3,
                                    ),
                                    Text("ID 2351 6534"),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "From",
                                      style: AppTextStyle().subtitle3,
                                    ),
                                    Text("Track number"),
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
                                    Text("Track number"),
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
                                      "Weight",
                                      style: AppTextStyle().subtitle3,
                                    ),
                                    Text("Track number"),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppButton(
                                        height: 35,
                                        padding: 1,
                                        textSize: 14,
                                        text: "Complete",
                                        textColor: AppColors.white,
                                        btnColor: AppColors.green,
                                        onClick: () {})
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                );
              })),
    );
  }
}
