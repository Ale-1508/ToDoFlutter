import 'package:flutter/material.dart';
import 'package:todo/application/core/style/colors.dart';
import 'package:todo/application/core/widget/CircleCheckbox.dart';

class ToDo extends StatelessWidget {
  final String description;
  final bool important;
  final String expiry;
  
  const ToDo({
    super.key,
    required this.description,
    this.expiry = "",
    this.important = false ,
  });

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
            const CircledCheckbox(scale: 1.2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if(important) const Icon(
                      Icons.priority_high,
                      size: 18,
                      color: SupportingColors.error
                    ),  
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(expiry.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}