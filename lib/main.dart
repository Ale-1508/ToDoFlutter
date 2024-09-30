import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/application/HomeScreen/HomeScreen.dart';
import 'package:todo/application/core/style/style.dart';
import 'package:todo/data/toDoProvider.dart';

void main() async {
  await Hive.initFlutter();
  runApp(ChangeNotifierProvider(
      create: (context) => ToDoProvider(),
      child: const ToDoApp(),
    ),
  );
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do',
      theme: DefaultTheme.get(),
      home: const HomeScreen(),
    );
  }
}