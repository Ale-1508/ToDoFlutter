import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/logic/toDoLogic.dart';

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
    print(toDoList);
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
          return ListTile(
            title: Text(toDoList[index]["description"].toString()),
          );
        },
      )
    );
  }
}
