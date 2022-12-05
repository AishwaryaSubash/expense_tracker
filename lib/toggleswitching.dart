import 'package:flutter/material.dart';

class Toggler extends StatefulWidget {
  const Toggler({super.key});

  @override
  State<Toggler> createState() => _TogglerState();
}

class _TogglerState extends State<Toggler> {
  int isEnabled = 1;
  final animationDuration = const Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isEnabled = 1;
              });
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
              decoration: BoxDecoration(
                //color: (isEnabled == 1) ? Color(0xff1d2a31) : Color(0xffffffff),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(50),
                ),
              ),
              child: const Text(
                "Weekly",
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isEnabled = 2;
              });
            },
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(50),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: const Text(
                "Monthly",
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
