import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

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
  late TooltipBehavior _tooltipBehavior;
  int index = 0;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    initializeDateFormatting("in");
    const List<String> days = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ];
    setState(() {
      index = days.indexOf(DateFormat('EEEE').format(DateTime.now().toLocal()));
    });

    /// e.g Thursday

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<WeekData> weekData = [
      WeekData('Sunday', 25, const Color.fromRGBO(9, 0, 136, 1)),
      WeekData('Monday', 38, const Color.fromRGBO(147, 0, 119, 1)),
      WeekData('Tuesday', 34, const Color.fromRGBO(228, 0, 124, 1)),
      WeekData('Wednesday', 52, const Color.fromRGBO(255, 189, 57, 1)),
      WeekData('Thursday', 34, const Color.fromARGB(255, 180, 111, 149)),
      WeekData('Friday', 52, const Color.fromARGB(255, 57, 255, 136)),
      WeekData('Saturday', 34, const Color.fromARGB(255, 112, 111, 186)),
    ];
    return Column(
      children: [
        Center(
          child: SizedBox(
            height: size.height * 0.5,
            width: (size.width > size.height) ? size.width * 0.5 : size.width,
            child: Center(
              child: SfCircularChart(
                tooltipBehavior: _tooltipBehavior,
                legend: Legend(
                  isVisible: true,
                  position: (size.width > size.height)
                      ? LegendPosition.right
                      : LegendPosition.bottom,
                  overflowMode: LegendItemOverflowMode.wrap,
                  height: "110%",
                  isResponsive: true,
                  orientation: LegendItemOrientation.horizontal,
                ),
                series: <CircularSeries>[
                  // Renders doughnut chart
                  DoughnutSeries<WeekData, String>(
                    dataSource: weekData,
                    pointColorMapper: (WeekData data, _) => data.color,
                    xValueMapper: (WeekData data, _) => data.x,
                    yValueMapper: (WeekData data, _) => data.y,
                    explode: true,
                    explodeIndex: index,
                    explodeGesture: ActivationMode.singleTap,
                    enableTooltip: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
