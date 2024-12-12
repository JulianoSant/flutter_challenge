import 'package:flutter_challenge/models/option.dart';

class Question {
  final String name;
  final int type;
  dynamic value;
  final List<Option>? optionsList;

  Question({
    required this.name,
    required this.type,
    this.value,
    this.optionsList,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      name: json['name'],
      type: json['type'],
      value: json['value'],
      optionsList:
          json['optionsList'] != null ? (json['optionsList'] as List).map((option) => Option.fromJson(option)).toList() : null,
    );
  }
}
