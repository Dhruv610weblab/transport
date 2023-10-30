import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/text_style.dart';

class TimelinePage extends StatelessWidget {
  final List<TimelineItem> timelineItems = [
    TimelineItem("821 Jodioc Parkway, Colument City IL", "23 Apr"),
    TimelineItem("982 Cermij View", "25 Apr"),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: timelineItems
              .map((item) => TimelineTile(
                    alignment: TimelineAlign.manual,
                    lineXY: 0.2,
                    isFirst: timelineItems.indexOf(item) == 0,
                    isLast:
                        timelineItems.indexOf(item) == timelineItems.length - 1,
                    indicatorStyle: IndicatorStyle(
                      width: 12,
                      height: 12,
                      color: AppColors.black,
                    ),
                    beforeLineStyle:
                        LineStyle(color: AppColors.black, thickness: 1),
                    afterLineStyle:
                        LineStyle(color: AppColors.black, thickness: 1),
                    startChild: Container(
                      padding: EdgeInsets.only(right: 2),
                      child: Text(item.date, style: AppTextStyle().subtitle7),
                    ),
                    endChild: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                      child: Text(
                        item.description,
                        style: AppTextStyle().subtitle7,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class TimelineItem {
  final String description;
  final String date;

  TimelineItem(this.description, this.date);
}
