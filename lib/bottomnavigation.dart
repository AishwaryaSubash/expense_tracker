import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/addexpense.dart';

import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/profile.dart';
import 'package:flutter_application_1/stat.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key, required this.page});
  final String page;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
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
              size: (widget.page == "Home") ? 30 : 25,
              color: isDarkMode
                  ? (widget.page == "Home")
                      ? const Color(0xFFFF2424)
                      : const Color(0xFF979797)
                  : (widget.page == "Home")
                      ? const Color(0xFF041a0e)
                      : const Color(0xFF979797),
            ),
            onPressed: () {
              if (widget.page != "Home") {
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
                  ? (widget.page == "Stat")
                      ? const Color(0xFFFF2424)
                      : const Color(0xFF979797)
                  : (widget.page == "Stat")
                      ? const Color(0xFF041a0e)
                      : const Color(0xFF979797),
              size: (widget.page == "Stat") ? 30 : 25,
            ),
            onPressed: () {
              if (widget.page != "Stat") {
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
                  ? (widget.page == "Add")
                      ? const Color(0xFFFF2424)
                      : const Color(0xFF979797)
                  : (widget.page == "Add")
                      ? const Color(0xFF041a0e)
                      : const Color(0xFF979797),
              size: (widget.page == "Add") ? 30 : 25,
            ),
            onPressed: () {
              if (widget.page != "Add") {
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
                  ? (widget.page == "Profile")
                      ? const Color(0xFFFF2424)
                      : const Color(0xFF979797)
                  : (widget.page == "Profile")
                      ? const Color(0xFF041a0e)
                      : const Color(0xFF979797),
              size: (widget.page == "Profile") ? 30 : 25,
            ),
            onPressed: () {
              if (widget.page != "Profile") {
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
