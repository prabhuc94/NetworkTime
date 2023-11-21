import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:networktime/networktime.dart';
import 'package:networktime/timedetector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  ValueNotifier<DateTime?> valueNotifier = ValueNotifier(null);

  @override
  void initState() {
    timeDetector
      ..enableLog = kDebugMode
      ..repeatDuration(value: const Duration(minutes: 2))
      ..setComparison(input: DateTime.now().copyWith(hour: 16, minute: 01, second: 08))
      ..setChanged(onChanged: (val) => valueNotifier.value = val);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ValueListenableBuilder(valueListenable: valueNotifier, builder: (_, value, __) => Text('Running on: ${Networktime.now()} ${value ?? ""}'),),
        ),
      ),
    );
  }
}
