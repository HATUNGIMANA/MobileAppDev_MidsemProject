import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  
  static const Color primaryTheme = Color.fromRGBO(228, 183, 3, 0.769); // Opacity 77 = 0.77

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: primaryTheme,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back,', style: TextStyle(fontSize: 14, color: Colors.black)),
            Text('Eric Hatungimana', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
          ],
        ),
       
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Accounts Section
            Container(
              padding: EdgeInsets.all(16),
              color: primaryTheme,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('MY ACCOUNTS', 
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                  
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(16),
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Xpress Account', 
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 8),
                    Text('1441000000000', 
                        style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Show my balance', 
                            style: TextStyle(color: Colors.blue[800])),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Quick Transaction Section
            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Text('QUICK TRANSACTION',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(16),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildDashboardButton(context, 'Accounts', Icons.account_balance, '/accounts'),
                _buildDashboardButton(context, 'Transfer', Icons.send, '/transfer'),
                _buildDashboardButton(context, 'Pay Bills', Icons.payment, '/bills'),
                _buildDashboardButton(context, 'History', Icons.history, '/history'),
              ],
            ),
          ],
        ),
      ),
     
    );
  }

  Widget _buildDashboardButton(BuildContext context, String title, IconData icon, String route) {
    return Card(
      elevation: 2,
      color: DashboardScreen.primaryTheme.withOpacity(0.9),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => Navigator.pushNamed(context, route),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: Colors.black),
              SizedBox(height: 8),
              Text(title, 
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}