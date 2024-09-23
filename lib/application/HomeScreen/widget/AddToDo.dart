import 'package:flutter/material.dart';
import 'package:todo/application/core/style/colors.dart';

class AddToDo extends StatefulWidget {
  const AddToDo({super.key});

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  final todoTextfieldController = TextEditingController();

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
                    onPressed: () {
                      print("hello");
                    },  
                  ),
                  IconButtonSmall(
                    icon: Icons.priority_high,
                    onPressed: () {
                      print("hello");
                    },  
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  print(todoTextfieldController.text);
                },
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

  const IconButtonSmall({
    super.key,
    required this.icon,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      iconSize: 24,
      color: colors.text,
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
