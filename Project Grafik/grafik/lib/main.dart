import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() => runApp(GrafikApp());

class GrafikApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: GrafikPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GrafikPage extends StatelessWidget {
  final List<double> data = [
    120, 180, 130, 110, 100, 90, 170, 150, 160, 120,
    190, 140, 180, 175, 160, 130, 100, 145, 165, 190,
    130, 160, 150, 140, 170, 120, 110, 160
  ];

  List<FlSpot> generateSpots() {
    return List.generate(data.length, (i) => FlSpot(i.toDouble(), data[i]));
  }

  List<LineChartBarData> generateLines() {
    List<FlSpot> allSpots = generateSpots();
    List<LineChartBarData> lines = [];

    for (int i = 1; i < allSpots.length; i++) {
      final prev = allSpots[i - 1];
      final curr = allSpots[i];
      lines.add(LineChartBarData(
        spots: [prev, curr],
        isCurved: false,
        barWidth: 2,
        dotData: FlDotData(show: false),
        color: curr.y >= prev.y ? Colors.green : Colors.red,
      ));
    }

    return lines;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Grafik Kejayaan Kekaisaran'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: true, drawVerticalLine: true),
            borderData: FlBorderData(show: true),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, _) =>
                      Text('Hari ${value.toInt()}', style: TextStyle(fontSize: 10)),
                  reservedSize: 28,
                  interval: 5,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 20,
                  getTitlesWidget: (value, _) =>
                      Text('${value.toInt()}', style: TextStyle(fontSize: 10)),
                  reservedSize: 28,
                ),
              ),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            lineBarsData: generateLines(),
            lineTouchData: LineTouchData(
              enabled: true,
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: Colors.tealAccent,
                getTooltipItems: (spots) => spots.map((spot) {
                  return LineTooltipItem(
                    'Hari ${spot.x.toInt()}\n${spot.y.toInt()}',
                    TextStyle(color: Colors.black),
                  );
                }).toList(),
              ),
            ),
            minY: 80,
            maxY: 200,
          ),
        ),
      ),
    );
  }
}
