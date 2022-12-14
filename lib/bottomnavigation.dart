import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/addexpense.dart';

import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/stat.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, required this.page});
  final String page;
  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.home_rounded,
              size: (page == "Home") ? 30 : 25,
              color: isDarkMode
                  ? (page == "Home")
                      ? const Color(0xFFFF2424)
                      : const Color(0xFF979797)
                  : (page == "Home")
                      ? const Color(0xFF041a0e)
                      : const Color(0xFF979797),
            ),
            onPressed: () {
              if (page != "Home") {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                  ModalRoute.withName("/"),
                );
              }
            },
          ),
          IconButton(
            icon: Icon(
              Icons.pie_chart_rounded,
              color: isDarkMode
                  ? (page == "Stat")
                      ? const Color(0xFFFF2424)
                      : const Color(0xFF979797)
                  : (page == "Stat")
                      ? const Color(0xFF041a0e)
                      : const Color(0xFF979797),
              size: (page == "Stat") ? 30 : 25,
            ),
            onPressed: () {
              if (page != "Stat") {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Stat(),
                  ),
                  ModalRoute.withName("/Stat"),
                );
              }
            },
          ),
          IconButton(
            icon: Icon(
              Icons.wallet_rounded,
              color: isDarkMode
                  ? (page == "Add")
                      ? const Color(0xFFFF2424)
                      : const Color(0xFF979797)
                  : (page == "Add")
                      ? const Color(0xFF041a0e)
                      : const Color(0xFF979797),
              size: (page == "Add") ? 30 : 25,
            ),
            onPressed: () {
              if (page != "Add") {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddExpense(),
                  ),
                  ModalRoute.withName("/Add"),
                );
              }
            },
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: isDarkMode
                  ? (page == "Profile")
                      ? const Color(0xFFFF2424)
                      : const Color(0xFF979797)
                  : (page == "Profile")
                      ? const Color(0xFF041a0e)
                      : const Color(0xFF979797),
              size: (page == "Profile") ? 30 : 25,
            ),
            onPressed: () {
              if (page != "Profile") {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Profile(),
                    // builder: (context) => const Dummy(),
                  ),
                  ModalRoute.withName("/Profile"),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
