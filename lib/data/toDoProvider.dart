import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/logic/toDoLogic.dart';

class ToDoProvider with ChangeNotifier {
  List<dynamic> _toDoList = [];

  List<dynamic> get toDoList => _toDoList;


  Future<Map<String,dynamic>> addToDo(ToDo toDo) async {
    var box = await Hive.openBox('toDo');
    
    int lastKey = await box.add({
      "description": toDo.description,
      "isImportant": toDo.important,
      "expiry": toDo.expiry,
    });
    
    await fetchToDos();
    notifyListeners();
    return {
      "success": true,
      "lastKey":lastKey
    };
  }

  Future<void> fetchToDos() async {
    var box = await Hive.openBox('toDo');
    _toDoList = box.values.toList();
    notifyListeners();
  }

  Future<void> removeToDo(index) async {
    var box = await Hive.openBox('toDo');
    box.deleteAt(index);
    _toDoList.removeAt(index);
    notifyListeners();
  }
}
