import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:transport/screens/bottom_nav_screens/history/controllers/hitory_controller.dart';
import 'package:transport/screens/bottom_nav_screens/history/widget/staus.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/format_date.dart';
import '../../../../constants/text_style.dart';
import '../../../../widgets/page_background.dart';
import '../widget/timeline.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary2,
      body: ScreenBackground(
          title: 'Trip History',
          child: GetBuilder(
              init: HistoryController(),
              builder: (historyController) {
                if (historyController.isHistory.value) {
                  return Center(child: CircularProgressIndicator());
                }
                return RefreshIndicator(
                  onRefresh: () => historyController.history(),
                  child: ListView.builder(
                      // shrinkWrap: true,
                      itemCount: historyController.historyList.isEmpty
                          ? 1
                          : historyController.historyList.length,
                      itemBuilder: (context, index) {
                        if (historyController.historyList.isEmpty) {
                          return Center(
                            child: Text(
                              "History not found",
                              style: AppTextStyle().subtitle6,
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              padding: const EdgeInsets.all(18),
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
                                          "ID #${historyController.historyList[index].id}",
                                          style: AppTextStyle().subtitle5),
                                      StatusWidget(status: 0)
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  Text('Shipping',
                                      style: AppTextStyle().subtitle7),
                                  TimelinePage(timelineItems: [
                                    TimelineItem(
                                        "${historyController.historyList[index].pickupAdd1}, ${historyController.historyList[index].pickupCity}, ${historyController.historyList[index].pickupState}, ${historyController.historyList[index].pickupCountry}, (${historyController.historyList[index].pickupZip})",
                                        "${formatDate(historyController.historyList[index].pickupDate)}"),
                                    TimelineItem(
                                        "${historyController.historyList[index].shipAdd1}, ${historyController.historyList[index].shipState}, ${historyController.historyList[index].shipState}, ${historyController.historyList[index].shipCountry}, (${historyController.historyList[index].shipZip})",
                                        "${formatDate(historyController.historyList[index].shipDate)}"),
                                  ])
                                ],
                              )),
                        );
                      }),
                );
              })),
    );
  }
}
