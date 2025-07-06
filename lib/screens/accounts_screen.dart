import 'package:flutter/material.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accounts & Balances')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Checking Account'),
            subtitle: Text('Balance: \$2,000'),
          ),
          ListTile(
            title: Text('Savings Account'),
            subtitle: Text('Balance: \$5,500'),
          ),
        ],
      ),
    );
  }
}