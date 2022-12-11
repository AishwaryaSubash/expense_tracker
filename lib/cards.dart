import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  String uuid = "default";
  @override
  void initState() {
    super.initState();

    getStringValuesSF();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringValue = prefs.getString('userId');
    if (stringValue != null) {
      setState(() {
        uuid = stringValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 0,
        top: 20,
        bottom: 0,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        //color: const Color(0xff1d2a30),
        gradient: const LinearGradient(
          begin: Alignment(1.0, -1.0),
          end: Alignment(-1.0, 1.0),
          colors: [
            Color(0xff1d2a30),
            Color(0xFF1f3038),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Total Balance",
                style: TextStyle(color: Colors.grey),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Row(
                  children: const [
                    Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.white,
                    ),
                    Gap(5),
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 8,
                    ),
                    Gap(5),
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                      size: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(10),
          const Text(
            "₹ 100,000,000",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Name",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    "Akash",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width > 330 ? 15 : 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: SvgPicture.network(
                    "https://avatars.dicebear.com/api/bottts/$uuid.svg?scale=100",
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
