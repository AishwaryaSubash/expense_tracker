import 'package:flutter/material.dart';

class StatBox extends StatelessWidget {
  const StatBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            spreadRadius: 1,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        //color: const Color(0xff1d2a30),
        gradient: const LinearGradient(
          begin: Alignment(1.0, -1.0),
          end: Alignment(-1.0, 1.0),
          colors: [
            Color(0xff1d2a30),
            Color(0xFF1f3038),
          ],
        ),
      ),
    );
  }
}
