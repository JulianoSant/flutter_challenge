import 'package:flutter/material.dart';
import 'package:flutter_challenge/models/question.dart';
import 'package:flutter_challenge/views/widgets/currency_input_widget.dart';
import 'package:flutter_challenge/views/widgets/date_input_widget.dart';
import 'package:flutter_challenge/views/widgets/dropdown_input_widget.dart';
import 'package:flutter_challenge/views/widgets/integer_input_widget.dart';
import 'package:flutter_challenge/views/widgets/text_input_widget.dart';

class QuestionField extends StatelessWidget {
  final Question question;
  final ValueChanged<dynamic> onChanged;

  const QuestionField({
    super.key,
    required this.question,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    switch (question.type) {
      case 1:
        return TextInputWidget(
          question: question,
          onChanged: onChanged,
        );
      case 2:
        return DateInputwidget(
          question: question,
          onChanged: onChanged,
        );
      case 3:
        return IntegerInputWidget(
          question: question,
          onChanged: onChanged,
        );
      case 4:
        return CurrencyInputWidget(
          question: question,
          onChanged: onChanged,
        );
      case 5:
        return DropdownInputWidget(
          question: question,
          onChanged: onChanged,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
