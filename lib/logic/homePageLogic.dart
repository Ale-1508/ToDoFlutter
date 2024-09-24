import 'package:hive_flutter/hive_flutter.dart';

void openBox() async {
  var box = await Hive.openBox('myBox');
  print(box);
}