import 'package:flutter/material.dart';
import 'calculadora_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora'),
        ),
        body: const Center(
          child: CalculadoraView(),
        ),
      ),
    );
  }
}