import 'package:flutter/material.dart';

class BillsScreen extends StatelessWidget {
  static const Color primaryTheme = Color.fromRGBO(255, 236, 175, 0.77);
  final List<String> billCategories = [
    'Search',
    'Card payments',
    'Church',
    'Clubs And Societies',
    'Data Bundles',
    'Donations',
    'Events & Entertainment',
    'eVoucher Solution',
    'Financial Services',
    'Fintechs'
  ];

  BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay a new bill', style: TextStyle(color: Colors.black)),
        backgroundColor: primaryTheme,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[100],
        child: GridView.count(
          padding: const EdgeInsets.all(16),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: billCategories.map((category) {
            return _buildBillCategoryCard(context, category);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildBillCategoryCard(BuildContext context, String category) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TransferScreen(initialBeneficiary: category),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _getCategoryIcon(category),
                size: 32,
                color: Colors.black,
              ),
              const SizedBox(height: 8),
              Text(
                category,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'search':
        return Icons.search;
      case 'card payments':
        return Icons.credit_card;
      case 'church':
        return Icons.church;
      case 'clubs and societies':
        return Icons.people;
      case 'data bundles':
        return Icons.data_usage;
      case 'donations':
        return Icons.volunteer_activism;
      case 'events & entertainment':
        return Icons.event;
      case 'evoucher solution':
        return Icons.card_giftcard;
      case 'financial services':
        return Icons.attach_money;
      case 'fintechs':
        return Icons.phone_iphone;
      default:
        return Icons.receipt;
    }
  }
}

class TransferScreen extends StatefulWidget {
  final String initialBeneficiary;
  static const Color primaryTheme = Color.fromRGBO(255, 236, 175, 0.77);

  const TransferScreen({super.key, required this.initialBeneficiary});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedAccount = 'XPRESS';
  String? selectedNetwork;
  String mobileNumber = '233555596291';
  String beneficiaryName = '';
  String amount = '0.00';
  String note = '';

  @override
  void initState() {
    super.initState();
    beneficiaryName = widget.initialBeneficiary;
  }

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
                'GHS 0.97',
                onTap: () => _showAccountSelection(context),
              ),
              const SizedBox(height: 16),

              // Network Selection
              const Text('Select network operator', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 8),
              _buildSelectionCard(
                selectedNetwork ?? 'Select network',
                '',
                onTap: () => _showNetworkSelection(context),
              ),
              const SizedBox(height: 16),

              // Mobile Number
              const Text('Mobile number', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 8),
              _buildInputField('233555596291', (value) => mobileNumber = value),
              const SizedBox(height: 16),

              // Beneficiary Name (pre-filled with selected category)
              const Text('Beneficiary name', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 8),
              _buildInputField(beneficiaryName, (value) => beneficiaryName = value),
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
              subtitle: Text('GHS 0.97'),
              onTap: () {
                setState(() => selectedAccount = 'XPRESS');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Current Account'),
              subtitle: Text('GHS 50.16'),
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
              title: const Text('MTN'),
              onTap: () {
                setState(() => selectedNetwork = 'MTN');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Vodafone'),
              onTap: () {
                setState(() => selectedNetwork = 'Vodafone');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('AirtelTigo'),
              onTap: () {
                setState(() => selectedNetwork = 'AirtelTigo');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}