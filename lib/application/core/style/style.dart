import 'package:flutter/material.dart';
import 'package:todo/application/core/style/colors.dart';

class DatetimeFormat {
  static String standard = "yyyy-MM-dd kk:mm";
} 

class DefaultTheme {
  static ThemeData get(){
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: colors.primary,
        onPrimary: Colors.white,
        onSurface: Colors.black,
      ),
      dialogBackgroundColor: Colors.white,
    );
  } 
}

class DateTimePickerTheme {
  static Function setTheme = (BuildContext context, Widget? child) {
    return Theme(
      data: ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light(
          primary: colors.primary,
          onPrimary: Colors.white,
          onSurface: Colors.black,
        ),
        dialogBackgroundColor: Colors.white,
      ),
      child: child!,
    );
  };
}