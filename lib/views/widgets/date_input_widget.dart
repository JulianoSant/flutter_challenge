import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/question.dart';
import 'package:intl/intl.dart';

class DateInputwidget extends StatelessWidget {
  final Question question;
  final ValueChanged<String> onChanged;

  const DateInputwidget({
    super.key,
    required this.question,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: question.name,
        border: const OutlineInputBorder(),
      ),
      readOnly: true,
      controller: TextEditingController(
        text: question.value ?? '',
      ),
      onTap: () async {
        DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
        if (selectedDate != null) {
          onChanged(DateFormat('dd/MM/yyyy').format(selectedDate));
        }
      },
    );
  }
}
