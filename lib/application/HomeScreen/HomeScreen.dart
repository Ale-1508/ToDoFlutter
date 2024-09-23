import 'package:flutter/material.dart';
import 'package:todo/application/HomeScreen/widget/AddToDo.dart';
import 'package:todo/application/core/style/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [AddToDo()],
      ),
      backgroundColor: NeutralColors.shade200,
    );
  }
}
