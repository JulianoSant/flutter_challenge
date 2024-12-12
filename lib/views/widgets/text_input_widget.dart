import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/question.dart';

class TextInputWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<String> onChanged;

  const TextInputWidget({
    super.key,
    required this.question,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: question.name,
        border: const OutlineInputBorder(),
      ),
      onChanged: onChanged,
    );
  }
}
