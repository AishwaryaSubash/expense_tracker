import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/stat.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, required this.page});
  final String page;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 18,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.home_rounded,
              color: Color(0xFF041a0e),
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
            icon: const Icon(
              Icons.pie_chart_rounded,
              color: Color(0xFF979797),
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
            icon: const Icon(
              Icons.wallet_rounded,
              color: Color(0xFF979797),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Color(0xFF979797),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
