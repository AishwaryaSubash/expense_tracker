import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottomnavigation.dart';
import 'package:flutter_application_1/cards.dart';
import 'package:flutter_application_1/listcard.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            left: 5.0,
            bottom: 5.0,
            top: 5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Sunday,",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              Text(
                "20 November",
                style: TextStyle(
                  color: Color(0xFF041a0e),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 12.0,
              top: 5,
              bottom: 5,
            ),
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const Icon(
                Icons.notifications_none_outlined,
                color: Color(0xFF979797),
              ),
            ),
          ),
        ],
        backgroundColor: const Color(0xFFf6f6f6),
      ),
      bottomNavigationBar: const BottomNavigation(
        page: "Home",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 18, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Cards(),
              Gap(25),
              Text(
                "Today's Transactions",
                style: TextStyle(
                  color: Color(0xFF041a0e),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Gap(25),
              ListCard(
                image: "youtube",
                name: "Youtube",
                price: "-₹60.00",
                time: "16:30 PM",
                color: 0xfffdecec,
                type: "Credit",
              ),
              Gap(10),
              ListCard(
                image: "github",
                name: "GitHub",
                price: "-₹80.00",
                time: "11:30 AM",
                color: 0xfff4f4f4,
                type: "Credit",
              ),
              Gap(10),
              ListCard(
                image: "hackerrank",
                name: "Hackerrank",
                price: "-₹50.00",
                time: "16:30 PM",
                color: 0xffebf9ff,
                type: "Cash",
              ),
              Gap(10),
              ListCard(
                image: "youtube",
                name: "Youtube",
                price: "-₹100.00",
                time: "16:30 PM",
                color: 0xfffdecec,
                type: "Credit",
              ),
              Gap(10),
              ListCard(
                image: "github",
                name: "GitHub",
                price: "-₹20.00",
                time: "11:30 AM",
                color: 0xfff4f4f4,
                type: "Credit",
              ),
              Gap(10),
              ListCard(
                image: "hackerrank",
                name: "Hackerrank",
                price: "-₹50.00",
                time: "16:30 PM",
                color: 0xffebf9ff,
                type: "Cash",
              ),
              Gap(10),
              ListCard(
                image: "youtube",
                name: "Youtube",
                price: "-₹1000.00",
                time: "12:30 PM",
                color: 0xfffdecec,
                type: "Cash",
              ),
              Gap(10),
              ListCard(
                image: "github",
                name: "GitHub",
                price: "-₹200.00",
                time: "3:30 AM",
                color: 0xfff4f4f4,
                type: "Credit",
              ),
              Gap(10),
              ListCard(
                image: "hackerrank",
                name: "Hackerrank",
                price: "-₹510.00",
                time: "6:30 PM",
                color: 0xffebf9ff,
                type: "Credit",
              ),
              Gap(5),
            ],
          ),
        ),
      ),
    );
  }
}
