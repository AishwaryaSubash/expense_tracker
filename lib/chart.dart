import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String? stringValue = prefs.getString('userId');
  return stringValue;
}

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class ChartData {
  ChartData({required this.x, required this.y});
  final String x;
  final int y;
}

class _ChartState extends State<Chart> {
  late TooltipBehavior _tooltipBehavior;
  late SelectionBehavior _selectionBehavior;

  var stat;

  Future<dynamic> fetchAlbum() async {
    var res = await getStringValuesSF();

    final response = await http.get(
      Uri.parse("https://expense-backend.vercel.app/stats/$res"),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // print(response.body);
      setState(() {
        stat = jsonDecode(response.body);
      });
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load statistics');
    }
  }

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      header: "Day",
      animationDuration: 2,
    );
    _selectionBehavior = SelectionBehavior(
      enable: true,
      selectedColor: const Color(0xfff0435a),
      unselectedOpacity: 1,
    );
    super.initState();

    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = <ChartData>[
      ChartData(
        x: 'Mon',
        y: stat[0]["quota"][1],
      ),
      ChartData(
        x: 'Tue',
        y: stat[0]["quota"][2],
      ),
      ChartData(
        x: 'Wed',
        y: stat[0]["quota"][3],
      ),
      ChartData(
        x: 'Thu',
        y: stat[0]["quota"][4],
      ),
      ChartData(
        x: 'Fri',
        y: stat[0]["quota"][5],
      ),
      ChartData(
        x: 'Sat',
        y: stat[0]["quota"][6],
      ),
      ChartData(
        x: 'Sun',
        y: stat[0]["quota"][0],
      ),
    ];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(15),
      child: Center(
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          borderWidth: 0,
          enableAxisAnimation: true,
          borderColor: Colors.transparent,
          tooltipBehavior: _tooltipBehavior,
          primaryXAxis: CategoryAxis(
            isVisible: true,
            borderWidth: 0,
            majorGridLines: const MajorGridLines(width: 0),
            axisLine: const AxisLine(width: 0),
            name: "Day",
            associatedAxisName: "Day",
          ),
          primaryYAxis: NumericAxis(
            isVisible: false,
            borderWidth: 0,
            majorGridLines: const MajorGridLines(width: 0),
            axisLine: const AxisLine(width: 0),
          ),
          series: <ColumnSeries<ChartData, String>>[
            ColumnSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              enableTooltip: true,
              selectionBehavior: _selectionBehavior,
              width: 0.5,
              color: const Color(0xff1d2a31),
              isTrackVisible: true,
              trackColor: const Color(0xffececec),
            ),
          ],
        ),
      ),
    );
  }
}
