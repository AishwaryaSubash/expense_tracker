import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.20,
      width: size.width,
      decoration: const BoxDecoration(
        color: Color(0xff1d2a31),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(280, 100),
          bottomRight: Radius.elliptical(280, 100),
        ),
      ),
    );
  }
}
