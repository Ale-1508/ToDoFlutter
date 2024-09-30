import 'package:flutter/material.dart';
import 'package:todo/application/HomeScreen/widget/AddToDo.dart';
import 'package:todo/application/HomeScreen/widget/ToDoList.dart';
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
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: AppBar(
              title: const Text(
                "To-Do List:",
                style: TextStyle(
                  fontWeight: FontWeight.w500
                ),
              ),
              backgroundColor: Colors.transparent,  
            ), 
          ),
        ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ToDoList(),
          AddToDo()
        ],
      ),
      backgroundColor: NeutralColors.shade200,
    );
  }
}
