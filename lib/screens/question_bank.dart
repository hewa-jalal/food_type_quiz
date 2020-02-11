import 'package:food_type_quiz/screens/question.dart';
import 'package:food_type_quiz/screens/toasts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionBank {
  static final QuestionBank _questionBank = QuestionBank._internal();

  factory QuestionBank() {
    return _questionBank;
  }

  QuestionBank._internal();

  int _questionNumber = 0;
  int _score = 0;
  int highScore;

  List<Question> _questionList = [
    Question('Coconut', 'images/coconut.png', 1, 'Fruit'),
    Question('Tomato', 'images/tomato.png', 2, 'Vegetable'),
    Question('Tomato', 'images/tomato.png', 2, 'Vegetable'),
    Question('Tomato', 'images/tomato.png', 2, 'Vegetable'),
    Question('Tomato', 'images/tomato.png', 2, 'Vegetable'),
    Question('Coconut', 'images/coconut.png', 1, 'Fruit'),
    Question('Coconut', 'images/coconut.png', 1, 'Fruit'),
    Question('Tomato', 'images/tomato.png', 2, 'Vegetable'),
    Question('Coconut', 'images/coconut.png', 1, 'Fruit'),
    Question('Tomato', 'images/tomato.png', 2, 'Vegetable'),
    Question('Tomato', 'images/tomato.png', 2, 'Vegetable'),
    Question('Coconut', 'images/coconut.png', 1, 'Fruit'),
    Question('Tomato', 'images/tomato.png', 2, 'Vegetable'),
    Question('Tomato', 'images/tomato.png', 2, 'Vegetable'),
    Question('Tomato', 'images/tomato.png', 2, 'Vegetable'),
    Question('Tomato', 'images/tomato.png', 2, 'Vegetable'),
  ];

  String getQuestionTitle() {
    return _questionList[_questionNumber].title;
  }

  incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    highScore = (prefs.getInt('counter') ?? 0) + 1;
    prefs.setInt('counter', highScore);
  }

  loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    highScore = (prefs.getInt('counter') ?? 0);
  }

  String getQuestionImage() {
    return _questionList[_questionNumber].imagePath;
  }

  List<Question> getList() => _questionList;

  void bigCheck(int choice) {
    if (_questionNumber < _questionList.length - 1) {
      if (choice == _questionList[_questionNumber].answer) {
        _score++;
        if (_score > highScore) {
          incrementCounter();
        }
        showToastWidget(CorrectToast());
      } else {
        showToastWidget(WrongToast());
      }
      _questionNumber++;
    } else {
      _questionNumber = 0;
    }
  }

  int getScore() => _score;

  int getLength() => _questionList.length;
}
