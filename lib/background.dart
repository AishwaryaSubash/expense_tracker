import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 290,
      width: size.width,
      decoration: const BoxDecoration(
        color: Color(0xff1d2a30),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(160, 50),
          bottomRight: Radius.elliptical(160, 50),
        ),
      ),
    );
  }
}
