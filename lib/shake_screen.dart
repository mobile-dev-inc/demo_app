import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

class ShakeScreen extends StatefulWidget {
  const ShakeScreen({super.key});

  @override
  State<ShakeScreen> createState() => _ShakeScreenState();
}

class _ShakeScreenState extends State<ShakeScreen> {
  ShakeDetector? _detector;
  String _lastShakeInfo = 'No shake detected yet';

  @override
  void initState() {
    super.initState();
    _startDetector();
  }

  @override
  void dispose() {
    _detector?.stopListening();
    super.dispose();
  }

  void _startDetector() {
    // Stop previous detector if exists
    _detector?.stopListening();

    _detector = ShakeDetector.autoStart(onPhoneShake: (ShakeEvent event) {
      setState(() {
        _lastShakeInfo = 'Shake detected!';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Shake Screen'),
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Last Shake Info:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(_lastShakeInfo),
          ],
        ))));
  }
}
