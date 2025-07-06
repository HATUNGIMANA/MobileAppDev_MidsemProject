import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of transactions (mock data)
    final List<Map<String, dynamic>> transactions = [
      {'title': 'Transfer to John', 'amount': 150.0, 'type': 'debit'},
      {'title': 'Electricity Bill', 'amount': 80.0, 'type': 'debit'},
      {'title': 'Salary', 'amount': 1000.0, 'type': 'credit'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final tx = transactions[index];

          return ListTile(
            leading: Icon(
              tx['type'] == 'debit'
                  ? Icons.arrow_upward
                  : Icons.arrow_downward,
              color: tx['type'] == 'debit' ? Colors.red : Colors.green,
            ),
            title: Text(tx['title'] as String),
            subtitle: Text('Amount: \$${tx['amount'].toString()}'),
          );
        },
      ),
    );
  }
}
