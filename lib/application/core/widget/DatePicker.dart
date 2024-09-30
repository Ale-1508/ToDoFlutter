import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/application/core/style/style.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key});
  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTime Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              selectedDate == null
                  ? 'No date selected!'
                  : 'Selected date: ${DateFormat(DatetimeFormat.standard).format(selectedDate!)}',
            ),
            Text(
              selectedTime == null
                  ? 'No time selected!'
                  : 'Selected time: ${selectedTime!.format(context)}',
            ),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select date'),
            ),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text('Select time'),
            ),
          ],
        ),
      ),
    );
  }
}