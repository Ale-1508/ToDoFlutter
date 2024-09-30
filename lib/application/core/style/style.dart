import 'package:flutter/material.dart';
import 'package:todo/application/core/style/colors.dart';

class DatetimeFormat {
  static String standard = "yyyy-MM-dd kk:mm";
} 

class DateTimePickerTheme {
  static Function setTheme = (BuildContext context, Widget? child) {
    return Theme(
      data: ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light(
          primary: colors.primary, // Header background color
          onPrimary: Colors.white, // Header text color
          onSurface: Colors.black, // Body text color
        ),
        dialogBackgroundColor: Colors.white, // Background color
      ),
      child: child!,
    );
  };
}