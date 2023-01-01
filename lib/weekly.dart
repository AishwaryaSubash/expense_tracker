import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class WeeklyChat extends StatefulWidget {
  const WeeklyChat({super.key, required this.userId});
  final String userId;
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
  final int y;
  final Color color;
}

class _WeeklyChatState extends State<WeeklyChat> {
  late TooltipBehavior _tooltipBehavior;
  int index = 0;
  var stat = null;
  final List<WeekData> weekData = [
    // WeekData('Sunday', 0, const Color.fromRGBO(9, 0, 136, 1)),
    // WeekData('Monday', 0, const Color.fromRGBO(147, 0, 119, 1)),
    // WeekData('Tuesday', 0, const Color.fromRGBO(228, 0, 124, 1)),
    // WeekData('Wednesday', 0, const Color.fromRGBO(255, 189, 57, 1)),
    // WeekData('Thursday', 0, const Color.fromARGB(255, 180, 111, 149)),
    // WeekData('Friday', 0, const Color.fromARGB(255, 57, 255, 136)),
    // WeekData('Saturday', 0, const Color.fromARGB(255, 112, 111, 186)),
  ];
  static const colors = [
    Color.fromRGBO(9, 0, 136, 1),
    Color.fromRGBO(147, 0, 119, 1),
    Color.fromRGBO(228, 0, 124, 1),
    Color.fromRGBO(255, 189, 57, 1),
    Color.fromARGB(255, 180, 111, 149),
    Color.fromARGB(255, 57, 255, 136),
    Color.fromARGB(255, 112, 111, 186),
  ];
  Future<dynamic> fetchAlbum() async {
    final response = await http.get(
      Uri.parse(
          "https://expense-backend.vercel.app/stats/weekly/${widget.userId}"),
    );
    const List<String> days = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ];
    if (response.statusCode == 200) {
      setState(() {
        stat = jsonDecode(response.body);
      });

      for (var element in stat) {
        weekData.add(WeekData(days[element["day"]], element["_sum"]["amount"],
            colors[element["day"]]));
      }
    } else {
      throw Exception('Failed to load statistics');
    }
  }

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
    fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return (stat != null)
        ? Column(
            children: [
              Center(
                child: SizedBox(
                  height: size.height * 0.5,
                  width: (size.width > size.height)
                      ? size.width * 0.5
                      : size.width,
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
                      annotations: <CircularChartAnnotation>[
                        CircularChartAnnotation(
                          widget: const Center(
                            child: Text(
                              'Weekly',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.5),
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
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
          )
        : const Padding(
            padding: EdgeInsets.all(20.0),
            child: SpinKitCircle(
              size: 100,
              color: Color(0xff1d2a31),
            ),
          );
  }
}
