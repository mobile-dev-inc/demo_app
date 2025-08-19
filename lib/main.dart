import 'package:demo_app/defects_screen.dart';
import 'package:demo_app/form_screen.dart';
import 'package:demo_app/input_screen.dart';
import 'package:demo_app/issue_1619_repro.dart';
import 'package:demo_app/issue_1677_repro.dart';
import 'package:demo_app/nesting_screen.dart';
import 'package:demo_app/swiping_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_launch_arguments/flutter_launch_arguments.dart';

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
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
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
  late final FlutterLaunchArguments _flutterLaunchArgumentsPlugin;

  int _counter = 0;
  int _delay = 0;

  @override
  void initState() {
    super.initState();
    _flutterLaunchArgumentsPlugin = FlutterLaunchArguments();
    _initializeVars();
  }

  Future<void> _initializeVars() async {
    final counterValue = await _flutterLaunchArgumentsPlugin.getInt('initialCounter');
    print('Initial counter value: $counterValue');

    final delayValue = await _flutterLaunchArgumentsPlugin.getInt('delay');
    print('Initial delay value: $delayValue');

    setState(() {
      _counter = counterValue ?? 0;
      _delay = delayValue ?? 0;
    });
  }

  Future<void> _incrementCounter() async {
    await Future.delayed(Duration(seconds: _delay));
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const DefectsScreen()),
                  );
                },
                child: const Text('Defects Test'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const NestingScreen()),
                  );
                },
                child: const Text('Nesting Test'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SwipingScreen()),
                  );
                },
                child: const Text('Swipe Test'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const FormScreen()),
                  );
                },
                child: const Text('Form Test'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const InputScreen()),
                  );
                },
                child: const Text('Input Test'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const Issue1677Repro()),
                  );
                },
                child: const Text('issue 1677 repro'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const Issue1619Repro()),
                  );
                },
                child: const Text('issue 1619 repro'),
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
