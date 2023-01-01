import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/scheduler.dart';

class Toggler extends StatefulWidget {
  const Toggler({super.key, required this.setShow});
  final Function setShow;
  @override
  State<Toggler> createState() => _TogglerState();
}

class _TogglerState extends State<Toggler> {
  int value = 0;
  bool positive = false;
  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Center(
      child: AnimatedToggleSwitch<int>.size(
        current: value,
        values: const [0, 1],
        iconOpacity: 0.6,
        innerColor: isDarkMode ? const Color(0xffABB4BD) : Colors.white,
        indicatorSize: const Size.fromWidth(200),
        borderColor: isDarkMode ? const Color(0xff1E1F28) : Colors.white,
        borderWidth: 3,
        colorBuilder: (i) =>
            isDarkMode ? const Color(0xff2A2C36) : const Color(0xff1d2a31),
        onChanged: (i) {
          setState(() => value = i);
          widget.setShow(value);
        },
        iconBuilder: (value, size) {
          if (value == 1) {
            return const Icon(
              Icons.calendar_month,
              color: Colors.amber,
            );
          } else {
            return const Icon(
              Icons.view_week_outlined,
              color: Colors.cyan,
            );
          }
        },
      ),
    );
  }
}
