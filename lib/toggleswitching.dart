import 'package:flutter/material.dart';

class Toggler extends StatefulWidget {
  const Toggler({super.key});

  @override
  State<Toggler> createState() => _TogglerState();
}

class _TogglerState extends State<Toggler> {
  int isEnabled = 1;
  final animationDuration = const Duration(milliseconds: 500);
  late AnimationController controller;
  late Animation colorAnimation;
  late Animation sizeAnimation;
  @override
  // void initState() {
  //   controller=AnimationController(duration: const Duration(seconds: 2),vsync: );
  //   colorAnimation =
  //       ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller);
  //   sizeAnimation = Tween<double>(begin: 100.0, end: 200.0).animate(controller);
  //   super.initState();
  // }

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
                color: (isEnabled == 1)
                    ? const Color(0xff1d2a31)
                    : const Color(0xffffffff),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(50),
                ),
              ),
              child: Text(
                "Weekly",
                style: TextStyle(
                  color: (isEnabled == 1)
                      ? const Color(0xffffffff)
                      : const Color(0xFF979797),
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
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(50),
                ),
                color: (isEnabled == 2)
                    ? const Color(0xff1d2a31)
                    : const Color(0xffffffff),
              ),
              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: Text(
                "Monthly",
                style: TextStyle(
                  color: (isEnabled == 2)
                      ? const Color(0xffffffff)
                      : const Color(0xFF979797),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
