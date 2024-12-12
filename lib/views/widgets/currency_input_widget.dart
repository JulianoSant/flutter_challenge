import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/question.dart';

class CurrencyInputWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<double?> onChanged;

  const CurrencyInputWidget({
    super.key,
    required this.question,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: question.name,
        prefixText: 'R\$ ',
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      onChanged: (value) => onChanged(double.tryParse(value)),
    );
  }
}
