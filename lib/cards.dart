import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
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
                children: const [
                  Text(
                    "Credit",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "5331 9034 8734 2536",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/mc.png',
                width: 100,
                height: 100,
                colorBlendMode: BlendMode.softLight,
              ),
            ],
          )
        ],
      ),
    );
  }
}
