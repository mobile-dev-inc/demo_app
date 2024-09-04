import 'package:flutter/material.dart';

class NestingScreen extends StatefulWidget {
  const NestingScreen({super.key});

  @override
  State<NestingScreen> createState() => _NestingScreenState();
}

class _NestingScreenState extends State<NestingScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: 48, vertical: 64);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nesting test screen'),
      ),
      body: Stack(
        children: [
          Semantics(
            identifier: 'level-0',
            explicitChildNodes: true,
            child: Container(
              padding: padding,
              child: Stack(
                children: [
                  Semantics(
                    identifier: 'level-1',
                    explicitChildNodes: true,
                    child: Container(
                      color: Colors.blue,
                      padding: padding,
                      child: Stack(
                        children: [
                          Semantics(
                            identifier: 'level-2',
                            explicitChildNodes: true,
                            child: Container(
                              color: Colors.orange,
                              padding: padding,
                            ),
                          ),
                          const Text('Container at level 2'),
                        ],
                      ),
                    ),
                  ),
                  const Text('Container at level 1'),
                ],
              ),
            ),
          ),
          const Text('Container at level 0'),
        ],
      ),
    );
  }
}
