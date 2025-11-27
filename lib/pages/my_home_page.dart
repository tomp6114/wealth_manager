import 'package:flutter/material.dart';
import 'package:money_manager/flavors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(F.title)),
      body: Center(child: Text('Hello ${F.title}')),
    );
  }
}
