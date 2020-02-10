import 'package:food_type_quiz/screens/question.dart';
import 'package:food_type_quiz/screens/toasts.dart';
import 'package:oktoast/oktoast.dart';

class QuestionBank {
  int _questionNumber = 0;
  int _score = 0;
  int _highScore = 0;

  List<Question> _questionList = [
    Question('Coconut', 'images/coconut.png', 1),
    Question('Tomato', 'images/tomato.png', 2)
  ];

  String getQuestionTitle() {
    return _questionList[_questionNumber].title;
  }

  String getQuestionTitleIndex(int index) {
    return _questionList[index].title;
  }

  String getImageIndex(int index) {
    return _questionList[index].imagePath;
  }

  int getHighScore() {
    if (_score > _highScore) {
      _highScore = _score;
    }
    return _highScore;
  }

  String getQuestionImage() {
    return _questionList[_questionNumber].imagePath;
  }

  void nextQuestion() {
    if (_questionNumber < _questionList.length - 1) {
      _questionNumber++;
      showToastWidget(CorrectToast());
    } else {
      resetQuestions();
    }
  }

  int incrementScore() {
    return _score++;
  }

  int getScore() => _score;

  void resetQuestions() {
    _questionNumber = 0;
  }

  int getLength() => _questionList.length;

  bool validateQuestion(int choice) {
    if (choice == _questionList[_questionNumber].answer) {
      return true;
    } else {
      return false;
    }
  }
}
