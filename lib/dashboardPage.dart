import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FinanceDashboard extends StatelessWidget {
  const FinanceDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 💰 Balance Overview
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: Colors.blueAccent,
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total Balance', style: TextStyle(color: Colors.white70)),
                        SizedBox(height: 8),
                        Text('\$12,340.50', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Icon(Icons.account_balance_wallet_rounded, color: Colors.white, size: 36),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 📈 Recent Transactions
            const Text('Recent Transactions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            ...List.generate(3, (index) => _transactionCard()),

            const SizedBox(height: 20),

            // 🧠 Spending Analytics (Pie Chart Placeholder)
            const Text('Spending Analytics', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(height: 200, child: PieChart(PieChartData(sections: [
              PieChartSectionData(value: 40, color: Colors.blue, title: 'Bills'),
              PieChartSectionData(value: 30, color: Colors.orange, title: 'Food'),
              PieChartSectionData(value: 20, color: Colors.green, title: 'Shopping'),
              PieChartSectionData(value: 10, color: Colors.purple, title: 'Others'),
            ]))),

            const SizedBox(height: 20),

            // 🏦 Accounts / Wallets
            const Text('Your Wallets', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _walletCard('Bank', '\$9,000', Colors.indigo),
                  _walletCard('Cash', '\$2,000', Colors.green),
                  _walletCard('Credit', '\$1,340', Colors.deepOrange),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 📅 Monthly Summary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Monthly Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                DropdownButton<String>(
                  value: 'June',
                  items: ['April', 'May', 'June'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                  onChanged: null,
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text('Income: \$5,000\nExpenses: \$3,000\nSavings: \$2,000'),
          ],
        ),
      ),
    );
  }

  Widget _transactionCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const ListTile(
        leading: CircleAvatar(child: Icon(Icons.fastfood)),
        title: Text('McDonalds'),
        subtitle: Text('June 14, 2025'),
        trailing: Text('-\$15.99', style: TextStyle(color: Colors.redAccent)),
      ),
    );
  }

  Widget _walletCard(String name, String balance, Color color) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name, style: const TextStyle(color: Colors.white70)),
          const SizedBox(height: 8),
          Text(balance, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
