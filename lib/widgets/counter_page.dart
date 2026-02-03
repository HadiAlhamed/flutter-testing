import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  num _result = 2;
  final TextEditingController numberController = TextEditingController();
  void _calculateSquare() {
    num number = num.parse(numberController.text.trim());
    setState(() {
      _result = number * number;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              key: Key("resultTextField"),
              controller: numberController,
              keyboardType: TextInputType.number,
            ),
            Text("$_result"),
            const Text("Counter Value"),
            Text(_counter.toString()),
            const SizedBox(height: 20),
            ElevatedButton(
              key: Key("addValue"),
              onPressed: _incrementCounter,
              child: const Text("Add Value"),
            ),
            ElevatedButton(
              key: Key("calculate"),
              onPressed: _calculateSquare,
              child: const Text("Calculate"),
            ),
          ],
        ),
      ),
    );
  }
}
