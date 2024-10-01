import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/application/core/style/colors.dart';
import 'package:todo/application/core/widget/CircleCheckbox.dart';
import 'package:todo/data/toDoProvider.dart';

class ToDo extends StatefulWidget {
  final int index;
  final String description;
  final bool important;
  final String expiry;
  final bool isDone;
  
  const ToDo({
    super.key,
    required this.index,
    required this.description,
    this.expiry = "",
    this.important = false,
    this.isDone = false,
  });

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          color: colors.background,
        ),
        child: Row(
          children: [
            //const Icon(Icons.check_circle),
            CircledCheckbox(
              scale: 1.2,
              checked: widget.isDone,
              onChanged: (bool isDoneNewValue) async {
                final provider = Provider.of<ToDoProvider>(context, listen: false);
                Map<dynamic, dynamic> toDo = await provider.getToDo(widget.index);
                toDo["isDone"] = isDoneNewValue;
                await provider.editToDo(widget.index, toDo);
              }
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if(widget.important) const Icon(
                      Icons.priority_high,
                      size: 18,
                      color: SupportingColors.error
                    ),  
                    Text(
                      widget.description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(widget.expiry.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}