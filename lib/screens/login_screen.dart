import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        automaticallyImplyLeading: false, // Remove back arrow
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to HBank mobile app',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 1, 51, 151),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: '+233XXXXXXXXX',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Enter your phone number' : null,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _pinController,
                decoration: InputDecoration(
                  labelText: 'Enter your PIN',
                  suffixIcon: Icon(Icons.visibility_off), // Toggle visibility
                ),
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'Enter your PIN' : null,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Add forgotten PIN logic here
                  },
                  child: Text('Forgotten PIN?'),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 236, 175, 77), // Green button
                  minimumSize: Size(double.infinity, 50), // Full width
                ),
                child: Text('Login'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Add any additional logic (e.g., authentication) here
                    Navigator.pushReplacementNamed(context, '/dashboard');
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