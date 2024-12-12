import '../models/question.dart';
import '../services/mock_service.dart';

class QuestionsController {
  final List<Question> _questions = MockService.getQuestions();
  final Map<String, dynamic> _userAnswers = {};

  int currentPage = 0;
  final int totalPages = 3;

  List<Question> getCurrentPageQuestions() {
    int startIndex = currentPage * 5;
    return _questions.skip(startIndex).take(5).toList();
  }

  int getCurrentPage() {
    return currentPage;
  }

  void setPage(int page) {
    if (page >= 0 && page < totalPages) {
      currentPage = page;
    }
  }

  bool canGoNext() => currentPage < totalPages - 1;

  void nextPage() {
    if (canGoNext()) {
      currentPage++;
    }
  }

  // Armazena a resposta de uma pergunta
  void saveAnswer(Question question, dynamic value) {
    _userAnswers[question.name] = value;
  }

  // retorna todas as respostas do usuário
  Map<String, dynamic> getAllAnswers() {
    return _userAnswers;
  }
}
