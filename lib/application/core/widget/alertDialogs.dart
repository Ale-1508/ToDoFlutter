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

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function onConfirm;
  final Function onCancel;

  const ConfirmationDialog({
    super.key,
    this.title = "",
    required this.message,
    required this.onConfirm,
    this.onCancel = _defaultOnCancel,
  });

  static void _defaultOnCancel(){}

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
            onCancel();
          },
        ),
        TextButton(
          child: const Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
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