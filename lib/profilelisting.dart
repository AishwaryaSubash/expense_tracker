import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';

class ProfileListing extends StatelessWidget {
  const ProfileListing({
    super.key,
    required this.icons,
    required this.text,
  });
  final IconData icons;
  final String text;
  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Row(
      children: <Widget>[
        Icon(
          icons,
          size: 35,
          color: isDarkMode ? const Color(0xFFEF3651) : Colors.black,
        ),
        const Gap(30),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        )
      ],
    );
  }
}
