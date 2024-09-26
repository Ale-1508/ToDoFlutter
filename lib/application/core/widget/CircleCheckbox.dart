import 'package:flutter/material.dart';

class CircledCheckbox extends StatefulWidget {
  final double scale;
  const CircledCheckbox({
    super.key, 
    this.scale = 1,
  });

  @override
  State<CircledCheckbox> createState() => _CircledCheckboxState();
}

class _CircledCheckboxState extends State<CircledCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: widget.scale,
      child: Checkbox(
        shape: const CircleBorder(),
        value: isChecked,
        onChanged: (bool? newValue) {
          setState(() {
            isChecked = newValue!;
          });
        },
      ),
    )
    ;
  }
}