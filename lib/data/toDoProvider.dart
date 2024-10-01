import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/logic/toDoLogic.dart';

class ToDoProvider with ChangeNotifier {
  List<dynamic> _toDoList = [];

  List<dynamic> get toDoList => _toDoList;
  static const String _boxName = "toDo";

  Future<Map<String,dynamic>> addToDo(ToDo toDo) async {
    var box = await Hive.openBox(_boxName);
    
    int lastKey = await box.add({
      "description": toDo.description,
      "isImportant": toDo.important,
      "expiry": toDo.expiry,
      "isDone": false,
    });
    
    await fetchToDos();
    notifyListeners();
    return {
      "success": true,
      "lastKey":lastKey
    };
  }

  Future<void> fetchToDos() async {
    var box = await Hive.openBox(_boxName);
    _toDoList = box.values.toList();
    notifyListeners();
  }

  Future<void> removeToDo(index) async {
    var box = await Hive.openBox(_boxName);
    box.deleteAt(index);
    _toDoList.removeAt(index);
    notifyListeners();
  }

  Future<void> editToDo(int index,Map<dynamic, dynamic> value) async {
    var box = await Hive.openBox(_boxName);
    await box.putAt(index, value);
    //_toDoList.removeAt(index);
  }
  
  Future<Map<dynamic, dynamic>> getToDo(int index) async {
    var box = await Hive.openBox(_boxName);
    return await box.getAt(index);
  }
}
