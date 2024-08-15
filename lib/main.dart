import 'package:demo_app/form_test.dart';
import 'package:demo_app/issue_1677_repro.dart';
import 'package:demo_app/swipe_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

class HackyDrawPointersBinding extends IntegrationTestWidgetsFlutterBinding {
  HackyDrawPointersBinding() {
    framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  }
  static WidgetsBinding ensureInitialized() {
    HackyDrawPointersBinding().framePolicy =
        LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
    assert(
      WidgetsBinding.instance is HackyDrawPointersBinding,
    );
    return WidgetsBinding.instance;
  }

  @override
  TestBindingEventSource get pointerEventSource => TestBindingEventSource.test;
}

void main() {
  HackyDrawPointersBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SwipeTestPage()),
                );
              },
              child: const Text('Swipe Test'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const FormTestPage()),
                );
              },
              child: const Text('Form Test'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Issue1677Repro()),
                );
              },
              child: const Text('issue 1677 repro'),
            ),
            const Text(
              'You have pushed the button this many times',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Semantics(
        identifier: 'fabAddIcon',
        child: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
