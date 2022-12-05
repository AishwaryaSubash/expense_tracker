import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottomnavigation.dart';
import 'package:gap/gap.dart';

class Stat extends StatelessWidget {
  const Stat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff1d2a31),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Statistics",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigation(
        page: "Stat",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Expenses Average",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 17,
                ),
              ),
              Row(
                children: const [
                  Text(
                    "₹500,000,000",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(20),
                  Icon(
                    Icons.arrow_drop_down_circle_rounded,
                    size: 15,
                  ),
                  Text(
                    "20%",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
