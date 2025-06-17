import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Reports', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Spending Breakdown',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: PieChart(PieChartData(sections: [
                PieChartSectionData(value: 35, color: Colors.blue, title: 'Bills'),
                PieChartSectionData(value: 25, color: Colors.orange, title: 'Food'),
                PieChartSectionData(value: 20, color: Colors.green, title: 'Shopping'),
                PieChartSectionData(value: 20, color: Colors.purple, title: 'Travel'),
              ])),
            ),
            const SizedBox(height: 24),
            const Text(
              'Monthly Trends',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 250,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 5,
                  minY: 0,
                  maxY: 800,
                  clipData: const FlClipData.all(),
                  gridData: const FlGridData(show: true),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 32,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(fontSize: 10);
                          switch (value.toInt()) {
                            case 0:
                              return const Text('Jan', style: style);
                            case 1:
                              return const Text('Feb', style: style);
                            case 2:
                              return const Text('Mar', style: style);
                            case 3:
                              return const Text('Apr', style: style);
                            case 4:
                              return const Text('May', style: style);
                            case 5:
                              return const Text('Jun', style: style);
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 100,
                        reservedSize: 40,
                      ),
                    ),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: true),
                  lineTouchData: const LineTouchData(enabled: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 300),
                        FlSpot(1, 500),
                        FlSpot(2, 400),
                        FlSpot(3, 650),
                        FlSpot(4, 700),
                        FlSpot(5, 600),
                      ],
                      isCurved: true,
                      color: Colors.blueAccent,
                      barWidth: 3,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Income vs Expenses',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    _ReportRow('Income', '\$5,200', Colors.green),
                    Divider(),
                    _ReportRow('Expenses', '\$3,750', Colors.redAccent),
                    Divider(),
                    _ReportRow('Net Savings', '\$1,450', Colors.blueAccent),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReportRow extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _ReportRow(this.label, this.value, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        Text(
          value,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}
