import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class ChartData {
  ChartData({required this.x, required this.y});
  final String x;
  final double y;
}

class _ChartState extends State<Chart> {
  late TooltipBehavior _tooltipBehavior;
  late SelectionBehavior _selectionBehavior;

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
    List<ChartData> chartData = <ChartData>[
      ChartData(x: 'Mon', y: 100),
      ChartData(x: 'Tue', y: 50),
      ChartData(x: 'Wed', y: 40),
      ChartData(x: 'Thu', y: 70),
      ChartData(x: 'Fri', y: 20),
      ChartData(x: 'Sat', y: 60),
      ChartData(x: 'Sun', y: 75),
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
