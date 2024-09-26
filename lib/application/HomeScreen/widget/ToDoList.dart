import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'ToDo.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList>{
  List<dynamic> toDoList = [];

  Future<void> fetchToDos() async {
    var box = await Hive.openBox('toDo');
    // await box.clear();
    setState(() {
      toDoList = box.values.toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchToDos();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDo(
            description: toDoList[index]["description"],
            important: toDoList[index]["important"],
            expiry: toDoList[index]["expiry"],
          );
        },
      )
    );
  }
}
