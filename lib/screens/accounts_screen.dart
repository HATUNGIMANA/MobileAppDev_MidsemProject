import 'package:flutter/material.dart';

class AccountsScreen extends StatelessWidget {
  
  static const Color primaryTheme = Color.fromRGBO(224, 173, 4, 0.769);
  
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY ACCOUNTS', style: TextStyle(color: Colors.black)),
        backgroundColor: primaryTheme,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            // Account Cards
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  _buildAccountCard(
                    'Xpress Account',
                    '144100273698',
                    'GHS 150,000.00',
                    'Available balance'
                  ),
                  SizedBox(height: 16),
                  _buildAccountCard(
                    'Current Account',
                    '1441003840759',
                    'GHS 13,000.00',
                    'Available balance'
                  ),
                ],
              ),
            ),
            // Add Account Button
            Padding(
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryTheme,
                  foregroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text('Add a new account'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountCard(String accountType, String accountNumber, String amount, String balanceType) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              accountType,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              accountNumber,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            SizedBox(height: 16),
            Divider(),
            SizedBox(height: 8),
            Text(
              amount,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 4),
            Text(
              balanceType,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}