import 'package:flutter/material.dart';

class SimpleAlertDialog extends StatelessWidget {
  final String title;
  final String message;

  const SimpleAlertDialog({
    super.key,
    this.title = "",
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

/*
showDialog(
  context: context,
  builder: (BuildContext context) {
    return const SimpleAlertDialog(message: "You need to write something!",);
  },
);
*/