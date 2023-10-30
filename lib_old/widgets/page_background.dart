import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';

class ScreenBackground extends StatelessWidget {
  final Widget child;
  final String? title;
  final bool isBack;
  final bool isSetting;
  final bool isAction;
  const ScreenBackground({
    super.key,
    required this.child,
    this.title,
    this.isBack = false,
    this.isSetting = false,
    this.isAction = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.shade2,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18), topRight: Radius.circular(18))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isBack == true
                        ? Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: IconButton(
                              onPressed: () => Get.back(),
                              icon: Icon(Icons.arrow_back),
                            ),
                          )
                        : SizedBox(
                            height: 45,
                            width: 45,
                          ),
                    Text(
                      title ?? "",
                      style: AppTextStyle().appBar,
                    ),
                    isAction == true
                        ? Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                  isSetting ? Icons.settings : Icons.more_vert),
                            ),
                          )
                        : SizedBox(
                            height: 45,
                            width: 45,
                          ),
                  ],
                ),
              ),
              Expanded(child: child)
            ],
          ),
        ),
      ),
    );
  }
}
