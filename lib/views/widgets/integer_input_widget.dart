import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/question.dart';

class IntegerInputWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<int?> onChanged;

  const IntegerInputWidget({
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
      keyboardType: TextInputType.number,
      onChanged: (value) => onChanged(int.tryParse(value)),
    );
  }
}
