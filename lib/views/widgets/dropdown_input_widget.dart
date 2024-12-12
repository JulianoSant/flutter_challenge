import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/question.dart';

class DropdownInputWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<String?> onChanged;

  const DropdownInputWidget({
    super.key,
    required this.question,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: question.name,
        border: const OutlineInputBorder(),
      ),
      value: question.value,
      items: question.optionsList?.map((option) {
        return DropdownMenuItem(
          value: option.id.toString(),
          child: Text(option.name),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
