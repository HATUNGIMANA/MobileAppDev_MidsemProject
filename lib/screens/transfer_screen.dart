import 'package:flutter/material.dart';

class TransferScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String recipient = '';
  double amount = 0.0;

  TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transfer Funds')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Recipient Account'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => recipient = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => amount = double.parse(value!),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Transfer'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Transfer successful!')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}