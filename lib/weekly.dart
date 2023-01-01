import 'package:flutter/material.dart';

class WeeklyChat extends StatefulWidget {
  const WeeklyChat({super.key});

  @override
  State<WeeklyChat> createState() => _WeeklyChatState();
}

class WeekData {
  WeekData(
    this.x,
    this.y,
    this.color,
  );
  final String x;
  final double y;
  final Color color;
}

class _WeeklyChatState extends State<WeeklyChat> {
  @override
  Widget build(BuildContext context) {
    final List<WeekData> weekData = [
      WeekData('David', 25, const Color.fromRGBO(9, 0, 136, 1)),
      WeekData('Steve', 38, const Color.fromRGBO(147, 0, 119, 1)),
      WeekData('Jack', 34, const Color.fromRGBO(228, 0, 124, 1)),
      WeekData('Others', 52, const Color.fromRGBO(255, 189, 57, 1))
    ];
    return Container(
      child: const Text("Weekly"),
    );
  }
}
