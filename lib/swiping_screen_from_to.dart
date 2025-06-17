import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SwipingScreenFromTo extends StatefulWidget {
  const SwipingScreenFromTo({super.key});

  @override
  State<SwipingScreenFromTo> createState() => _SwipingScreenFromToState();
}

class _SwipingScreenFromToState extends State<SwipingScreenFromTo> {
  int selectedIndex = 0;
  final List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Select an Item',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Semantics(
                    identifier: 'scrollWheel',
                    child: CupertinoPicker(
                      itemExtent: 40,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      children: items.map((String item) {
                        return Center(
                          child: Text(
                            item,
                            style: const TextStyle(fontSize: 20),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Selected: ${items[selectedIndex]}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
