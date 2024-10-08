import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/application/core/style/colors.dart';
import 'package:todo/application/core/style/style.dart';
import 'package:todo/data/toDoProvider.dart';
import 'package:todo/logic/toDoLogic.dart';

class AddToDo extends StatefulWidget {
  const AddToDo({super.key});

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  final FocusNode focusNode = FocusNode();
  final todoTextfieldController = TextEditingController();
  
  DateTime? expiry;
  bool important = false;

  void toggleKeyboard() {
    if (focusNode.hasFocus) {
      focusNode.unfocus();
    } else {
      FocusScope.of(context).requestFocus(focusNode);
    }
  }

  void handleSave() async {
    final provider = Provider.of<ToDoProvider>(context, listen: false);
    toggleKeyboard();
    if (todoTextfieldController.text=="") return;
    
    ToDo toDo = ToDo(
      description: todoTextfieldController.text,
      expiry: expiry,
      important: important,
    );
    await provider.addToDo(toDo);

    resetState();
  }

  void resetState(){
    setState(() {
      important=false;
      expiry=null;
      todoTextfieldController.text="";
    });
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {return DateTimePickerTheme.setTheme(context, child);},
    );
    
    if (pickedDate==null) {
      expiry = null;
      return;
    }

    if (context.mounted){
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget? child) {return DateTimePickerTheme.setTheme(context, child);},
      );

      if (pickedTime != null && context.mounted){
        setState(() {
          expiry = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        color: colors.background,
      ),
      child: Column(
        children: [
          SmallTextField(todoTextfieldController: todoTextfieldController),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButtonSmall(
                    icon: Icons.alarm,
                    color: expiry!=null? colors.primary : colors.text,
                    onPressed: () {
                      expiry=DateTime.now();
                      _selectDateTime(context);
                    },  
                  ),
                  expiry!=null? Text(DateFormat(DatetimeFormat.standard).format(expiry!)) : const SizedBox.shrink(),
                  IconButtonSmall(
                    icon: Icons.priority_high,
                    color: important? SupportingColors.error : colors.text,
                    onPressed: () {setState(() {
                      important=!important;
                    });},  
                  ),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  minimumSize: const Size(64, 32),
                  textStyle: const TextStyle(fontSize: 12),
                  backgroundColor: colors.primary,
                  foregroundColor: colors.text, 
                ),
                onPressed: handleSave,
                child: const Text('SAVE'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class IconButtonSmall extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  const IconButtonSmall({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color = colors.text,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      iconSize: 24,
      color: color,
      onPressed: onPressed,
    );
  }
}

class SmallTextField extends StatelessWidget {
  SmallTextField({
    super.key,
    required this.todoTextfieldController,
  });

  final TextEditingController todoTextfieldController;
  final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(24),
    borderSide: const BorderSide(
      width: 0,
      color: Colors.transparent
    )
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: todoTextfieldController,
      cursorColor: colors.text,
      decoration: InputDecoration(
        hintText: "To Do",
        filled: true,
        fillColor: NeutralColors.shade150,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        focusedBorder: outlineInputBorder,
        enabledBorder: outlineInputBorder,
      )
    );
  }
}
