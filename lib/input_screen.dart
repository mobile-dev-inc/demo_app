import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lorem Ipsum'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: TextField(
            controller: _inputController,
            maxLines: null,
            decoration: const InputDecoration(
              labelText: 'Lorem Ipsum',
            ),
          ),
        ),
      ),
    );
  }
}
