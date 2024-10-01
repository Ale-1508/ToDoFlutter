import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/application/core/widget/alertDialogs.dart';
import 'package:todo/data/toDoProvider.dart';
import 'ToDo.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});
  
  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList>{
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ToDoProvider>(context, listen: false);
    provider.fetchToDos();
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
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ConfirmationDialog(
                    title: "Delete To-Do",
                    message: "Do you really want to Delete this To-Do?",
                    onConfirm: () async {
                      await provider.removeToDo(index);
                    },
                    onCancel: () {
                      setState(() {});
                    },
                  );
                },
              );
            },
            child: ToDo(
              index: index,
              description: provider.toDoList[index]["description"],
              important: provider.toDoList[index]["isImportant"] ?? false,
              expiry: provider.toDoList[index]["expiry"],
              isDone: provider.toDoList[index]["isDone"] ?? false,
            ),
          );
        },
      )
    );
  }
}
