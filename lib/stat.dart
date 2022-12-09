import 'package:flutter/material.dart';
import 'package:flutter_application_1/bottomnavigation.dart';
import 'package:flutter_application_1/chart.dart';
import 'package:flutter_application_1/listcard.dart';
import 'package:flutter_application_1/toggleswitching.dart';
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
        centerTitle: true,
        title: const Text(
          "Statistics",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
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
              const Gap(20),
              const Chart(),
              const Gap(25),
              const Toggler(),
              const Gap(20),
              const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Gap(20),
              const ListCard(
                image: "hackerrank",
                name: "Hackerrank",
                price: "-₹50.00",
                time: "16:30 PM",
                color: 0xffebf9ff,
                type: "Cash",
              ),
              const Gap(10),
              const ListCard(
                image: "hackerrank",
                name: "Hackerrank",
                price: "-₹50.00",
                time: "16:30 PM",
                color: 0xffebf9ff,
                type: "Cash",
              ),
              const Gap(10),
              const ListCard(
                image: "hackerrank",
                name: "Hackerrank",
                price: "-₹50.00",
                time: "16:30 PM",
                color: 0xffebf9ff,
                type: "Cash",
              ),
              const Gap(10),
              const ListCard(
                image: "hackerrank",
                name: "Hackerrank",
                price: "-₹50.00",
                time: "16:30 PM",
                color: 0xffebf9ff,
                type: "Cash",
              ),
              const Gap(10),
              const ListCard(
                image: "hackerrank",
                name: "Hackerrank",
                price: "-₹50.00",
                time: "16:30 PM",
                color: 0xffebf9ff,
                type: "Cash",
              ),
              const Gap(10),
              const ListCard(
                image: "hackerrank",
                name: "Hackerrank",
                price: "-₹50.00",
                time: "16:30 PM",
                color: 0xffebf9ff,
                type: "Cash",
              ),
              const Gap(10),
              const ListCard(
                image: "hackerrank",
                name: "Hackerrank",
                price: "-₹50.00",
                time: "16:30 PM",
                color: 0xffebf9ff,
                type: "Cash",
              ),
              const Gap(10),
              const ListCard(
                image: "hackerrank",
                name: "Hackerrank",
                price: "-₹50.00",
                time: "16:30 PM",
                color: 0xffebf9ff,
                type: "Cash",
              ),
              const Gap(10),
              const ListCard(
                image: "hackerrank",
                name: "Hackerrank",
                price: "-₹50.00",
                time: "16:30 PM",
                color: 0xffebf9ff,
                type: "Cash",
              ),
              const Gap(10),
              const ListCard(
                image: "hackerrank",
                name: "Hackerrank",
                price: "-₹50.00",
                time: "16:30 PM",
                color: 0xffebf9ff,
                type: "Cash",
              ),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}
