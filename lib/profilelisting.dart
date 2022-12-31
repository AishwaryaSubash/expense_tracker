import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';

class ProfileListing extends StatefulWidget {
  const ProfileListing({
    super.key,
    required this.icons,
    required this.text,
  });
  final IconData icons;
  final String text;

  @override
  State<ProfileListing> createState() => _ProfileListingState();
}

class _ProfileListingState extends State<ProfileListing> {
  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Row(
      children: <Widget>[
        Icon(
          widget.icons,
          size: 35,
          color: isDarkMode ? const Color(0xff5562EB) : Colors.black,
        ),
        const Gap(30),
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 16,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        )
      ],
    );
  }
}
