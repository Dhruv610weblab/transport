import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transport/screens/bottom_nav_screens/history/view/history.dart';
import 'package:transport/screens/bottom_nav_screens/home/view/home_screen.dart';
import 'package:transport/screens/bottom_nav_screens/ongoing/view/ongoing.dart';
import 'package:transport/screens/bottom_nav_screens/profile/view/profile.dart';

import '../constants/colors.dart';

class Home extends StatefulWidget {
  final int? currIndex;
  const Home({Key? key, this.currIndex}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<PersistentBottomNavBarItem> bottomNav = [];
  int currentIndex = 0;
  // PersistentTabController? _controller;
  List<BottomNavigationBarItem> navBarsItems = [];
  List<Widget> pages = [
    HomeScreen(),
    OnGoingScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    if (mounted) {
      navBarsItems = [
        BottomNavigationBarItem(
          // textStyle: const TextStyle(fontSize: 12),
          activeIcon: Container(
            margin: const EdgeInsets.only(top: 4, bottom: 6),
            height: 30,
            width: 30,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'assets/icons/active_home.png',
              ),
            ),
          ),
          icon: Container(
            margin: const EdgeInsets.only(top: 4, bottom: 4),
            height: 30,
            width: 30,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'assets/icons/home.png',
              ),
            ),
          ),
          // textStyle: const TextStyle(
          //   fontSize: 12,
          // ),

          label: "",
          // activeColorPrimary: AppColors.primary,
          // inactiveColorPrimary: AppColors.icon,
        ),
        BottomNavigationBarItem(
          activeIcon: Container(
            margin: const EdgeInsets.only(top: 4, bottom: 6),
            height: 30,
            width: 30,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'assets/icons/active_show.png',
              ),
            ),
          ),
          icon: Container(
            margin: const EdgeInsets.only(top: 4, bottom: 4),
            height: 30,
            width: 30,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'assets/icons/show.png',
              ),
            ),
          ),
          // textStyle: const TextStyle(
          //   fontSize: 12,
          // ),
          label: "",
          // activeColorPrimary: AppColors.primary,
          // inactiveColorPrimary: AppColors.icon,
        ),
        BottomNavigationBarItem(
          activeIcon: Container(
            margin: const EdgeInsets.only(top: 4, bottom: 6),
            height: 30,
            width: 30,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'assets/icons/active_history.png',
              ),
            ),
          ),
          icon: Container(
            margin: const EdgeInsets.only(top: 4, bottom: 4),
            height: 30,
            width: 30,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'assets/icons/history.png',
              ),
            ),
          ),
          // textStyle: const TextStyle(
          //   fontSize: 12,
          // ),
          label: "",

          // activeColorPrimary: AppColors.primary,
          // inactiveColorPrimary: AppColors.icon,
        ),
        BottomNavigationBarItem(
          activeIcon: Container(
            margin: const EdgeInsets.only(top: 4, bottom: 6, left: 0, right: 0),
            height: 30,
            width: 30,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'assets/icons/active_profile.png',
              ),
            ),
          ),
          icon: Container(
            margin: const EdgeInsets.only(top: 4, bottom: 4),
            height: 30,
            width: 30,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'assets/icons/profile.png',
              ),
            ),
          ),
          // textStyle: TextStyle(fontSize: 12),
          label: "",
          // activeColorPrimary: AppColors.primary,
          // inactiveColorPrimary: AppColors.icon,
        ),
      ];
      widget.currIndex != null
          ? currentIndex = widget.currIndex!
          : currentIndex = 0;
      setState(() {
        // _controller = PersistentTabController(initialIndex: currentIndex);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 12,
        currentIndex: currentIndex,
        selectedFontSize: 12,
        iconSize: 20,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: AppColors.primary2,
        unselectedItemColor: AppColors.grey,
        onTap: (index) {
          // if (index == 0) {
          //   FeedController feedController = Get.put(FeedController());
          //   feedController.indexOfTab(0);
          //   feedController.announcementHome();
          //   feedController.anniversaryHome();
          //   feedController.birthdayHome();
          // }
          // if (index == 1) {
          //   AttendanceController attendanceController =
          //       Get.put(AttendanceController());
          //   attendanceController.attendanceHome();
          // }
          // if (index == 2) {
          //   LeaveController leaveController = Get.put(LeaveController());
          //   leaveController.leavesTypeHome();
          //   leaveController.leavesHome();
          // }
          // if (index == 3) {
          //   ServiceRequestController serviceRequestController =
          //       Get.put(ServiceRequestController());
          //   serviceRequestController.serviceTypeHome();
          //   serviceRequestController.services();
          // }
          // if (index == 4) {
          //   ProfileController profileController = Get.put(ProfileController());
          //   profileController.profileHome();
          //   profileController.country();
          // }
          setState(() {
            currentIndex = index;
          });
        },
        items: navBarsItems,
      ),
    );
  }
}
