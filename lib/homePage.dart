import 'package:flutter/material.dart';
import 'package:skin/dashboardPage.dart'; // Your existing dashboard
// Placeholder screens
import 'transactions_page.dart';
import 'budgets_page.dart';
import 'reports_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const FinanceDashboard(),
    const TransactionsPage(),
    const BudgetsPage(),
    const ReportsPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Transactions'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Budgets'),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
