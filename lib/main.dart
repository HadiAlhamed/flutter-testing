import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget(title: "Test Widget App", message: "center message"));
}

class MyWidget extends StatelessWidget {
  final String title;
  final String message;
  final Widget? icon;
  const MyWidget({
    super.key,
    required this.title,
    required this.message,
    this.icon,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(key: Key('appBar'), title: Text(title)),
        body: Center(
          child: Row(children: [Text(message), icon ?? SizedBox.shrink()]),
        ),
      ),
    );
  }
}
