import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LaunchArgumentsScreen extends StatefulWidget {
  const LaunchArgumentsScreen({Key? key}) : super(key: key);

  @override
  State<LaunchArgumentsScreen> createState() => _LaunchArgumentsScreenState();
}

class _LaunchArgumentsScreenState extends State<LaunchArgumentsScreen> {
  List<String> _arguments = [];

  @override
  void initState() {
    super.initState();
    _fetchArguments();
  }

  Future<void> _fetchArguments() async {
    const platform = MethodChannel('launch_arguments');
    final args = await platform.invokeMethod<List<dynamic>>('getLaunchArguments');
    setState(() {
      _arguments = args?.map((e) => e.toString()).toList() ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Launch Arguments")),
      body: ListView.builder(
        itemCount: _arguments.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(_arguments[index]));
        },
      ),
    );
  }
}
