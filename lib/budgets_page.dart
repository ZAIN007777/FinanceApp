import 'package:flutter/material.dart';

class BudgetsPage extends StatelessWidget {
  const BudgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final budgets = [
      {'category': 'Food', 'limit': 300, 'spent': 180, 'color': Colors.orange},
      {'category': 'Transport', 'limit': 150, 'spent': 90, 'color': Colors.blue},
      {'category': 'Entertainment', 'limit': 200, 'spent': 120, 'color': Colors.purple},
      {'category': 'Shopping', 'limit': 250, 'spent': 240, 'color': Colors.green},
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Budgets', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: budgets.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final item = budgets[index];
            final percent = (item['spent'] as num).toDouble() / (item['limit'] as num).toDouble();
            final color = item['color'] as Color;

            return Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['category'] as String,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: percent,
                      minHeight: 10,
                      backgroundColor: color.withOpacity(0.2),
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${item['spent']} / \$${item['limit']} spent',
                      style: TextStyle(
                        color: percent > 1.0 ? Colors.red : Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
