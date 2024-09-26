import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/logic/toDoLogic.dart';

Future<Map<String,dynamic>> addToDo(ToDo toDo) async {
  var box = await Hive.openBox('toDo');
  
  int lastKey = await box.add({
    "description": toDo.description,
    "isImportant": toDo.important,
    "expiry": toDo.expiry,
  });
  return {
    "success": true,
    "lastKey":lastKey
  };
}

Future<int> getLastKey() async {
  var box = await Hive.openBox('toDo');
  return box.keys.last;
}