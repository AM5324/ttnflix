import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TtnFlixDatePicker {
  final BuildContext context;
  final String dateFormat;
  final ValueChanged<String>? date;

  TtnFlixDatePicker(this.context, {this.dateFormat = 'yyyy-MM-dd', this.date});

  void show() async {
    var pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      String formattedDate =
      DateFormat(dateFormat).format(pickedDate);
      if (date != null) {
        date!(formattedDate);
      }
    }
  }
}

