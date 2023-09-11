import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/task_inherited.dart';
import 'package:flutter_application_1/screens/tela_inicial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contato',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskInherited(
        child: const InitialScreen(),
      ),
    );
  }
}
