import 'package:flutter/material.dart';

class FormTestPage extends StatefulWidget {
  const FormTestPage({super.key});

  @override
  State<FormTestPage> createState() => _FormTestPageState();
}

class _FormTestPageState extends State<FormTestPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  if (email == 'correct@mobile.dev' && password == 'maestro') {
                    _message = 'Credentials are correct';
                  } else {
                    _message = 'Invalid email or password';
                  }

                  setState(() {});
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 8),
              Text(_message),
            ],
          ),
        ),
      ),
    );
  }
}
