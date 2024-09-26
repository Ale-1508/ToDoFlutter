import 'package:flutter/material.dart';
import 'package:todo/application/core/style/colors.dart';

class ToDo extends StatelessWidget {
  final String description;
  final DateTime? expiry;
  final bool? important;
  
  const ToDo({
    super.key,
    required this.description,
    this.expiry,
    this.important = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: colors.background,
      ),
      child: Column(
        children: [
          Text(description),
          Text(important.toString()),
          Text(expiry.toString()),
        ],
      ),
    );
  }
}