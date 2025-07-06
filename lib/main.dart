import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/transfer_screen.dart';
import 'screens/bills_screen.dart';
import 'screens/accounts_screen.dart';
import 'screens/history_screen.dart';

void main() => runApp(BankApp());

class BankApp extends StatelessWidget {
  const BankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyBank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/transfer': (context) => TransferScreen(),
        '/bills': (context) => BillsScreen(),
        '/accounts': (context) => AccountsScreen(),
        '/history': (context) => HistoryScreen(),
      },
    );
  }
}