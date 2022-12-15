import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';

class Cards extends StatefulWidget {
  const Cards({
    super.key,
    required this.username,
    required this.uuid,
    required this.income,
  });
  final String username;
  final String uuid;
  final String? income;

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 0,
        top: 20,
        bottom: 0,
      ),
      decoration: BoxDecoration(
        boxShadow: isDarkMode
            ? [
                BoxShadow(
                  color: Colors.grey.shade800,
                  spreadRadius: 1,
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 1,
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
        borderRadius: BorderRadius.circular(20),
        // color: Color(0xEEEF3651),
        gradient: LinearGradient(
          begin: const Alignment(1.0, -1.0),
          end: const Alignment(-1.0, 1.0),
          colors: isDarkMode
              ? [
                  const Color(0xEEEF3651),
                  const Color(0xFFFF2424),
                ]
              : [
                  const Color(0xff1d2a30),
                  const Color(0xFF1f3038),
                ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Total Balance",
                style:
                    TextStyle(color: isDarkMode ? Colors.white : Colors.grey),
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
          Text(
            "₹ ${widget.income}",
            style: const TextStyle(
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
                  Text(
                    "Name",
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    widget.username,
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
                  child: (widget.uuid != "default")
                      ? Image.network(
                          "https://avatars.dicebear.com/api/bottts/${widget.uuid}.png?scale=100",
                        )
                      : null,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
