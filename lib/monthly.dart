import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class MonthlyChart extends StatefulWidget {
  const MonthlyChart({super.key, required this.userId});
  final String userId;

  @override
  State<MonthlyChart> createState() => _MonthlyChartState();
}

class _MonthlyChartState extends State<MonthlyChart> {
  late TooltipBehavior _tooltipBehavior;
  var stat;

  final List<MonthData> monthData = [];
  Future<dynamic> fetchAlbum() async {
    final response = await http.get(
      Uri.parse(
          "https://expense-backend.vercel.app/stats/monthly/${widget.userId}"),
    );
    const colors = [
      Color.fromRGBO(9, 0, 136, 1),
      Color.fromRGBO(147, 0, 119, 1),
      Color.fromRGBO(228, 0, 124, 1),
      Color.fromRGBO(255, 189, 57, 1),
    ];
    const List<String> weeks = [
      'Week 1',
      'Week 2',
      'Week 3',
      'Week 4',
    ];

    if (response.statusCode == 200) {
      setState(
        () {
          stat = jsonDecode(response.body);
        },
      );

      // for (var element in stat) {
      //   // monthData.add(MonthData(element[0], element[1]));
      //   print(element);
      // }
      for (var element in stat) {
        monthData.add(
          MonthData(weeks[element["week"] - 1], element["_sum"]["amount"],
              colors[element["week"] - 1]),
        );
      }
    } else {
      throw Exception('Failed to load statistics');
    }
  }

  @override
  void initState() {
    fetchAlbum();
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return (stat != null)
        ? Center(
            child: SizedBox(
                height: size.height * 0.5,
                width:
                    (size.width > size.height) ? size.width * 0.5 : size.width,
                child: SfCircularChart(
                    legend: Legend(
                      isVisible: true,
                      textStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color:
                            isDarkMode ? const Color(0xff5562EB) : Colors.black,
                      ),
                      position: (size.width > size.height)
                          ? LegendPosition.right
                          : LegendPosition.bottom,
                      overflowMode: LegendItemOverflowMode.wrap,
                      height: "110%",
                      isResponsive: true,
                      orientation: LegendItemOrientation.horizontal,
                    ),
                    tooltipBehavior: _tooltipBehavior,
                    series: <CircularSeries>[
                      RadialBarSeries<MonthData, String>(
                          enableTooltip: true,
                          dataSource: monthData,
                          // radius: "100%",
                          trackColor: Colors.grey.shade300,
                          pointColorMapper: (MonthData data, _) => data.color,
                          xValueMapper: (MonthData data, _) => data.x,
                          yValueMapper: (MonthData data, _) => data.y)
                    ])),
          )
        : Padding(
            padding: const EdgeInsets.all(20.0),
            child: SpinKitCircle(
              size: 100,
              color: isDarkMode
                  ? const Color(0xff5562EB)
                  : const Color(0xff1d2a31),
            ),
          );
  }
}

class MonthData {
  MonthData(this.x, this.y, this.color);
  final String x;
  final int y;
  final Color color;
}
