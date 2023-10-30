import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport/constants/colors.dart';
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Trip ID",
                                style: AppTextStyle().subtitle3,
                              ),
                              IconButton(
                                  onPressed: ()=>Get.to(()=>DetailScreen()),
                                  icon: Icon(
                                    Icons.info_outline,
                                    color: AppColors.primary1,
                                  ))
                            ],
                          ),
                          Text("ID 2351 6534"),
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
                                  child: AppButton(
                                      height: 35,
                                      padding: 0,
                                      textSize: 15,
                                      text: "Accept",
                                      textColor: AppColors.white,
                                      btnColor: AppColors.green,
                                      onClick: () {})),
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
                                      onClick: () {})),
                            ],
                          ),
                        ],
                      )),
                );
              })),
    );
  }
}
