import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/screens/Profile/profileUI.dart';
import 'package:freelancer_app/screens/chatUI.dart';
import 'package:freelancer_app/screens/homeUI.dart';
import 'package:freelancer_app/screens/savedUI.dart';
import 'package:freelancer_app/utils/animated_indexed_stack.dart';
import 'package:freelancer_app/utils/colors.dart';
import 'package:freelancer_app/utils/components.dart';
import 'package:freelancer_app/utils/sdp.dart';

class DashboardUI extends StatefulWidget {
  const DashboardUI({super.key});

  @override
  State<DashboardUI> createState() => _DashboardUIState();
}

class _DashboardUIState extends State<DashboardUI> {
  List<Widget> screens = [
    HomeUI(),
    ChatUI(),
    SavedUI(),
    ProfileUI(),
  ];
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: kScaffoldColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: AnimatedIndexedStack(
        index: activeTab,
        children: screens,
      ),
      bottomNavigationBar: kNavigationBar(),
    );
  }

  Widget kNavigationBar() {
    return SafeArea(
      child: Container(
        height: sdp(context, 56),
        color: kScaffoldColor,
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            kNavigationButton(
              index: 0,
              icon: 'home',
              label: 'Home',
            ),
            kNavigationButton(
              index: 1,
              icon: 'chat',
              label: 'Chat',
            ),
            kNavigationButton(
              index: 2,
              icon: 'saved',
              label: 'Saved',
            ),
            kNavigationButton(
              index: 3,
              icon: 'profile',
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget kNavigationButton({
    required int index,
    required String icon,
    required String label,
  }) {
    bool _isSelected = activeTab == index;
    icon = _isSelected ? icon + "-filled" : icon;
    return Expanded(
      child: InkWell(
        radius: 20,
        onTap: () {
          setState(() {
            activeTab = index;
          });
        },
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/icons/$icon.svg',
              height: sdp(context, 15),
              colorFilter: ColorFilter.mode(
                _isSelected ? kPillButtonColor : primaryColorAccent,
                BlendMode.srcIn,
              ),
            ),
            height5,
            Text(
              label,
              style: TextStyle(
                fontSize: sdp(context, 9),
                color: _isSelected ? kPillButtonColor : primaryColorAccent,
                fontWeight: _isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
