import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

getStringValuesSF() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return String
  String? stringValue = prefs.getString('userId');
  return stringValue;
}

class Chart extends StatefulWidget {
  const Chart({super.key, required this.chartData, this.stat});
  final List<ChartData> chartData;
  final dynamic stat;
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

  dynamic stat = null;

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
  }

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return (widget.stat != null)
        ? Container(
            decoration: BoxDecoration(
              color: isDarkMode ? const Color(0xFF2A2C36) : Colors.white,
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
                    dataSource: widget.chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    enableTooltip: true,
                    selectionBehavior: _selectionBehavior,
                    width: 0.5,
                    color: isDarkMode
                        ? const Color(0xff5562EB)
                        : const Color(0xff1d2a31),
                    isTrackVisible: true,
                    trackColor: const Color(0xffececec),
                  ),
                ],
              ),
            ),
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
