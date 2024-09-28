import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/data/toDoProvider.dart';
import 'ToDo.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});
  
  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList>{
  List<dynamic> toDoList = [];
  
  void updateToDoList() async {
    final provider = Provider.of<ToDoProvider>(context, listen: false);
    await provider.fetchToDos();
    setState(() {
      toDoList = provider.toDoList;
    });
  }

  @override
  void initState() {
    super.initState();
    updateToDoList();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ToDoProvider>(context);
    return Expanded(
      child: ListView.builder(
        itemCount: provider.toDoList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) async {
              await provider.removeToDo(index);
            },
            child: ToDo(
              description: provider.toDoList[index]["description"],
              important: provider.toDoList[index]["isImportant"] ?? false,
              expiry: provider.toDoList[index]["expiry"],
            ),
          );
        },
      )
    );
  }
}
