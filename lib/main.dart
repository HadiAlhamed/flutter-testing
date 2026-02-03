import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget(title: "Test Widget App", message: "center message"));
}

class MyWidget extends StatelessWidget {
  final String title;
  final String message;
  const MyWidget({super.key, required this.title, required this.message});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(child: Text(message)),
      ),
    );
  }
}
