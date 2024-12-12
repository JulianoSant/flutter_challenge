import '../models/question.dart';

class MockService {
  static List<Question> getQuestions() {
    final jsonData = [
      {"name": "Nome", "type": 1, "value": null},
      {"name": "Documento", "type": 1, "value": null},
      {"name": "E-mail", "type": 1, "value": null},
      {"name": "Telefone", "type": 1, "value": null},
      {"name": "Data de Nascimento", "type": 2, "value": "31/10/2000"},
      {
        "name": "Gênero",
        "type": 5,
        "value": null,
        "optionsList": [
          {"id": 120, "name": "Mulher Cis"},
          {"id": 124, "name": "Homem Cis"},
          {"id": 125, "name": "Mulher Trans"},
          {"id": 121, "name": "Homem Trans"},
          {"id": 126, "name": "Não Binário"}
        ]
      },
      {
        "name": "Estado Civil",
        "type": 5,
        "value": null,
        "optionsList": [
          {"id": 107, "name": "Solteiro(a)"},
          {"id": 110, "name": "Casado(a)"},
          {"id": 105, "name": "Em União Estável"},
          {"id": 108, "name": "Divorciado(a)"},
          {"id": 111, "name": "Viúvo(a)"},
          {"id": 112, "name": "Separado(a) Judicialmente"},
          {"id": 106, "name": "Separado(a)"},
          {"id": 109, "name": "Desquitado(a)"}
        ]
      },
      {"name": "Valor do Empréstimo", "type": 4, "value": "60000.00"},
      {"name": "Número de Parcelas", "type": 3, "value": null},
      {"name": "Data de Vencimento", "type": 2, "value": "26/01/2025"},
      {"name": "Nome da Mãe", "type": 1, "value": null}
    ];

    return jsonData.map((e) => Question.fromJson(e)).toList();
  }
}
