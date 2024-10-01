import 'package:flutter/material.dart';

class CircledCheckbox extends StatefulWidget {
  final double scale;
  final bool checked;
  final Function onChanged;

  const CircledCheckbox({
    super.key, 
    this.scale = 1,
    this.checked = false,
    this.onChanged = defaultOnChanged,
  });

  static void defaultOnChanged(){}

  @override
  State<CircledCheckbox> createState() => _CircledCheckboxState();
}

class _CircledCheckboxState extends State<CircledCheckbox> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.checked;
  }

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
            widget.onChanged(newValue);
          });
        },
      ),
    )
    ;
  }
}