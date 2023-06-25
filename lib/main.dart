import 'package:flutter/material.dart';

void main() {
  runApp(const ShopitApp());
}

class ShopitApp extends StatelessWidget {
  const ShopitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('ShopIt'),
        ),
      ),
    );
  }
}
