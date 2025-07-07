import 'package:flutter/material.dart';

class TransferScreen extends StatefulWidget {
  static const Color primaryTheme = Color.fromRGBO(237, 182, 2, 0.769);

  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedAccount = 'XPRESS';
  String? selectedNetwork;
  String mobileNumber = '233555596291';
  String beneficiaryName = 'Myself';
  String amount = '0.00';
  String note = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transfer Funds', style: TextStyle(color: Colors.black)),
        backgroundColor: TransferScreen.primaryTheme,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[100],
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Amount Section
              const Text('Enter amount', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text('GHS', style: TextStyle(color: Colors.grey[600])),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '0.00',
                        ),
                        onChanged: (value) => setState(() => amount = value),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Account Selection
              const Text('SELECT ACCOUNT', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 8),
              _buildSelectionCard(
                selectedAccount ?? 'Select account',
                'GHS 150,000.00',
                onTap: () => _showAccountSelection(context),
              ),
              const SizedBox(height: 16),

              // Network Selection
              const Text('Select network operator', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 8),
              _buildSelectionCard(
                selectedNetwork ?? 'Select Means of Transfer',
                '',
                onTap: () => _showNetworkSelection(context),
              ),
              const SizedBox(height: 16),

              // Mobile Number
              const Text('Account', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 8),
              _buildInputField('', (value) => mobileNumber = value),
              const SizedBox(height: 16),

              // Beneficiary Name
              const Text('Beneficiary name', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 8),
              _buildInputField('', (value) => beneficiaryName = value),
              const SizedBox(height: 16),

              // Note
              const Text('Add a note or #hashtag', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 8),
              _buildInputField('', (value) => note = value),
              const SizedBox(height: 32),

              // Continue Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: TransferScreen.primaryTheme,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Transfer initiated!')),
                    );
                  }
                },
                child: const Text('CONTINUE'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionCard(String title, String subtitle, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(subtitle, style: TextStyle(color: Colors.grey[600])),
                ],
              ],
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String initialValue, ValueChanged<String> onChanged) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      onChanged: onChanged,
    );
  }

  void _showAccountSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('XPRESS'),
              subtitle: Text('GHS 150,000.00'),
              onTap: () {
                setState(() => selectedAccount = 'XPRESS');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Current Account'),
              subtitle: Text('GHS 13,000.00'),
              onTap: () {
                setState(() => selectedAccount = 'Current Account');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showNetworkSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Mobile Money'),
              onTap: () {
                setState(() => selectedNetwork = 'Mobile Money');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('National Bank Transfer'),
              onTap: () {
                setState(() => selectedNetwork = 'National Bank Transfer');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Buy Airtime'),
              onTap: () {
                setState(() => selectedNetwork = 'Buy Airtime');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}