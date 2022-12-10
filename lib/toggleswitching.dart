import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class Toggler extends StatefulWidget {
  const Toggler({super.key});

  @override
  State<Toggler> createState() => _TogglerState();
}

class _TogglerState extends State<Toggler> {
  int value = 0;
  bool positive = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedToggleSwitch<int>.size(
        current: value,
        values: const [0, 1],
        iconOpacity: 0.6,
        innerColor: Colors.white,
        indicatorSize: const Size.fromWidth(200),
        borderColor: Colors.white,
        borderWidth: 3,
        colorBuilder: (i) => const Color(0xff1d2a31),
        onChanged: (i) => setState(() => value = i),
        iconBuilder: (value, size) {
          if (value == 1) {
            return const Icon(
              Icons.ac_unit_outlined,
              color: Colors.amber,
            );
          } else {
            return const Icon(
              Icons.access_alarms_rounded,
              color: Colors.cyan,
            );
          }
        },
      ),
    );
  }
}