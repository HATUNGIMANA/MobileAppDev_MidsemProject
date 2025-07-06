import 'package:flutter/material.dart';

class BillsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String biller = '';
  double amount = 0.0;

  BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bills Payment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Biller Name'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => biller = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Required' : null,
                onSaved: (value) => amount = double.parse(value!),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Pay'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Bill paid successfully!')),
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