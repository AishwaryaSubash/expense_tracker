import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.20,
      width: size.width,
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF2A2C36) : const Color(0xff1d2a31),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.elliptical(280, 100),
          bottomRight: Radius.elliptical(280, 100),
        ),
      ),
    );
  }
}
