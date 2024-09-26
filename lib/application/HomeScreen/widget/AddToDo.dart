import 'package:flutter/material.dart';
import 'package:todo/application/core/style/colors.dart';
import 'package:todo/application/core/widget/alertDialogs.dart';
import 'package:todo/logic/AddToDoLogic.dart';
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
    if (todoTextfieldController.text=="") return;
    
    ToDo toDo = ToDo(
      description: todoTextfieldController.text,
      expiry: expiry,
      important: important,
    );
    // add toDo to list
    Map<String,dynamic> result = await addToDo(toDo);

    // print addToDo result
    print(result["success"]);
    print(result["lastKey"]);
    
    resetState();
    toggleKeyboard();
  }

  void resetState(){
    setState(() {
      important=false;
      expiry=null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
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
                    onPressed: () {expiry=DateTime.now();},  
                  ),
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
                onPressed: handleSave,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  minimumSize: const Size(64, 32),
                  textStyle: const TextStyle(fontSize: 12),
                  backgroundColor: Colors.blue,
                  foregroundColor: colors.text, 
                ),
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
      onPressed: onPressed
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
