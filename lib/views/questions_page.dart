import 'package:flutter/material.dart';
import 'package:flutter_challenge/views/widgets/question_field.dart';
import '../controllers/questions_controller.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  late final QuestionsController controller;

  @override
  void initState() {
    super.initState();
    controller = QuestionsController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Empréstimo'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Precisamos de algumas informações para personalizar as melhores ofertas para você.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.getCurrentPageQuestions().length,
              itemBuilder: (context, index) {
                final question = controller.getCurrentPageQuestions()[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: QuestionField(
                    question: question,
                    onChanged: (value) {
                      setState(() {
                        // Atualiza o valor da pergunta
                        question.value = value;
                        // Salva a resposta da pergunta
                        controller.saveAnswer(question, value);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.totalPages,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == controller.currentPage ? Colors.blue : Colors.grey[300],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: index == controller.currentPage ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              // Verifica se todas as perguntas foram respondidas
              onPressed: _allQuestionsAnswered()
                  ? () {
                      // Verifica se é possível avançar para a próxima página, se não for, finaliza o formulário
                      if (controller.canGoNext()) {
                        setState(() {
                          controller.nextPage();
                        });
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Simulação Concluída'),
                            content: const Text(
                              'Recebemos seus dados, retornaremos com as melhores ofertas.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  final userAnswers = controller.getAllAnswers();
                                  debugPrint('$userAnswers');
                                  Navigator.of(context).popUntil((route) => route.isFirst);
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: _allQuestionsAnswered() ? Colors.blue : Colors.grey,
              ),
              child: Text(
                controller.getCurrentPage() == controller.totalPages - 1 ? 'Simular' : 'Próximo',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Verifica se todas as perguntas foram respondidas da página atual
  bool _allQuestionsAnswered() {
    return controller.getCurrentPageQuestions().every((question) {
      return question.value != null && question.value.toString().isNotEmpty;
    });
  }
}
