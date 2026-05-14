import 'package:flutter/material.dart';

class DateModel {
  DateTime? firstDate;
  DateTime? lastDate;
  TimeOfDay? firstTime;
  TimeOfDay? lastTime;
  String? occuranceValue;
  List<String>? selectedDays;

  DateModel(
      {this.firstDate,
      this.lastDate,
      this.firstTime,
      this.lastTime,
      this.occuranceValue,
      this.selectedDays});
}
