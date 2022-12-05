import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          child: SfCartesianChart(
            series: <ChartSeries>[
              BarSeries<ChartData, double>(
                dataSource: <ChartData>[
                  ChartData(45, 35),
                  ChartData(36, 28),
                  ChartData(78, 34),
                  ChartData(97, 32),
                  ChartData(61, 40),
                ],
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final double x;
  final double y;
}
