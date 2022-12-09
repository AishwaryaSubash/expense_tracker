import 'package:flutter/material.dart';
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
    return Row(
      children: <Widget>[
        Icon(
          icons,
          size: 35,
        ),
        const Gap(30),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
