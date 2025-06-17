import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      {'title': 'Starbucks', 'date': 'June 16, 2025', 'amount': '-\$5.75', 'icon': Icons.local_cafe},
      {'title': 'Netflix', 'date': 'June 15, 2025', 'amount': '-\$12.99', 'icon': Icons.movie},
      {'title': 'Salary', 'date': 'June 14, 2025', 'amount': '+\$3000.00', 'icon': Icons.attach_money},
      {'title': 'Uber', 'date': 'June 13, 2025', 'amount': '-\$8.50', 'icon': Icons.directions_car},
      {'title': 'Grocery', 'date': 'June 12, 2025', 'amount': '-\$42.10', 'icon': Icons.shopping_cart},
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Transactions', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: transactions.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final tx = transactions[index];
          final isIncome = tx['amount'].toString().startsWith('+');

          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent.withOpacity(0.1),
                child: Icon(tx['icon'] as IconData, color: Colors.blueAccent),
              ),
              title: Text(tx['title'] as String, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(tx['date'] as String),
              trailing: Text(
                tx['amount'] as String,
                style: TextStyle(
                  color: isIncome ? Colors.green : Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
