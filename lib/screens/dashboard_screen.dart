import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: GridView.count(
        padding: EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          _dashboardButton(context, 'Accounts', Icons.account_balance, '/accounts'),
          _dashboardButton(context, 'Transfer Funds', Icons.send, '/transfer'),
          _dashboardButton(context, 'Pay Bills', Icons.receipt, '/bills'),
          _dashboardButton(context, 'History', Icons.history, '/history'),
        ],
      ),
    );
  }

  Widget _dashboardButton(BuildContext context, String title, IconData icon, String route) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, route),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 10),
          Text(title),
        ],
      ),
    );
  }
}