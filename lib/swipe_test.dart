import 'package:flutter/material.dart';

class SwipeTestPage extends StatefulWidget {
  const SwipeTestPage({super.key});

  @override
  SwipeTestPageState createState() => SwipeTestPageState();
}

class SwipeTestPageState extends State<SwipeTestPage> {
  List<Color> containerColors = [Colors.red, Colors.red, Colors.red];

  void _onContainerTouched(int index) {
    setState(() {
      containerColors = [...containerColors]..[index] = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 16,
              bottom: 16,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Positioned(
              top: height * 0.1,
              left: width * 0.5,
              child: Listener(
                onPointerSignal: (_) => _onContainerTouched(0),
                onPointerHover: (_) => _onContainerTouched(0),
                onPointerDown: (_) => _onContainerTouched(0),
                onPointerUp: (_) => _onContainerTouched(0),
                child: Container(
                  width: 50,
                  height: 50,
                  color: containerColors[0],
                ),
              ),
            ),
            Positioned(
              top: height * 0.5,
              left: width * 0.1,
              child: Listener(
                onPointerSignal: (_) => _onContainerTouched(1),
                onPointerHover: (_) => _onContainerTouched(1),
                onPointerDown: (_) => _onContainerTouched(1),
                onPointerUp: (_) => _onContainerTouched(1),
                child: Container(
                  width: 50,
                  height: 50,
                  color: containerColors[1],
                ),
              ),
            ),
            Positioned(
              top: height * 0.9,
              left: width * 0.9,
              child: Listener(
                onPointerSignal: (_) => _onContainerTouched(2),
                onPointerHover: (_) => _onContainerTouched(2),
                onPointerDown: (_) => _onContainerTouched(2),
                onPointerUp: (_) => _onContainerTouched(2),
                child: Container(
                  width: 50,
                  height: 50,
                  color: containerColors[2],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
