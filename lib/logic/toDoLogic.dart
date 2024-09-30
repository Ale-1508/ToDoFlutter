import 'package:intl/intl.dart';
import 'package:todo/application/core/style/style.dart';

class ToDo {
  final String description;
  String _expiry = "";
  bool important;

  String get expiry => _expiry; 

  ToDo({
    required this.description,
    this.important = false,
    DateTime? expiry,
  }) {
    _expiry = expiry !=null ? DateFormat(DatetimeFormat.standard).format(expiry) : "";
  }

  void setImportant(bool value) {
    important = value;
  }
}