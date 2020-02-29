import 'package:food_type_quiz/components/lives_icon.dart';
import 'package:food_type_quiz/components/toasts.dart';
import 'package:food_type_quiz/models/question.dart';
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
  int _highScore;

  int getHighScore() => _highScore;

  List<Question> _questionList = [
    Question('Almond', 'images/almond.png', 1, 'Fruit'),
    Question('Apple', 'images/apple.png', 1, 'Fruit'),
    Question('Apricot', 'images/apricot.png', 1, 'Fruit'),
    Question('Avocado', 'images/avocado.png', 1, 'Fruit'),
    Question('Banana', 'images/banana.png', 1, 'Fruit'),
    Question('Beet', 'images/beet.png', 2, 'Vegetable'),
    Question('Lettuce', 'images/lettuce.png', 2, 'Vegetable'),
    Question('Celery', 'images/celery.png', 2, 'Vegetable'),
    Question('Carrot', 'images/carrot.png', 2, 'Vegetable'),
    Question('Cabbage', 'images/cabbage.png', 2, 'Vegetable'),
    Question('Cashew', 'images/cashew.png', 1, 'Fruit'),
    Question('Chestnut', 'images/chestnut.png', 1, 'Fruit'),
    Question('Chili', 'images/chili.png', 1, 'Fruit'),
    Question('Coconut', 'images/coconut.png', 1, 'Fruit'),
    Question('Cucumber', 'images/cucumber.png', 1, 'Fruit'),
    Question('Dates', 'images/dates.png', 1, 'Fruit'),
    Question('Eggplant', 'images/eggplant.png', 1, 'Fruit'),
    Question('Ginger', 'images/ginger.png', 2, 'Vegetable'),
    Question('Grape', 'images/grape.png', 1, 'Fruit'),
    Question('Hazelnut', 'images/Hazelnut.png', 1, 'Fruit'),
    Question('Macadamia', 'images/macadamia.png', 1, 'Fruit'),
    Question('Olive', 'images/olive.png', 1, 'Fruit'),
    Question('Onion', 'images/onion.png', 2, 'Vegetable'),
    Question('Orange', 'images/orange.png', 1, 'Fruit'),
    Question('Penaut', 'images/peanut.png', 2, 'Vegetable'),
    Question('Pecan', 'images/pecan.png', 1, 'Fruit'),
    Question('Pineapple', 'images/pineapple.png', 1, 'Fruit'),
    Question('Pistachio', 'images/pistachio.png', 1, 'Fruit'),
    Question('Potato', 'images/potato.png', 2, 'Vegetable'),
    Question('Pumpkin', 'images/pumpkin.png', 1, 'Fruit'),
    Question('Strawberry', 'images/strawberry.png', 1, 'Fruit'),
    Question('Tomato', 'images/tomato.png', 1, 'Fruit'),
    Question('Turnip', 'images/turnip.png', 2, 'Vegetable'),
    Question('Walnut', 'images/walnut.png', 1, 'Fruit'),
    Question('Watermelon', 'images/watermelon.png', 1, 'Fruit'),
    Question('Zucchini', 'images/zucchini.png', 1, 'Fruit'),
  ];

  String getQuestionTitle() {
    return _questionList[_questionNumber].title;
  }

  incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _highScore = (prefs.getInt('counter') ?? 0) + 1;
    prefs.setInt('counter', _highScore);
  }

  Future<int> loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return _highScore = (prefs.getInt('counter') ?? 0);
  }

  String getQuestionImage() {
    return _questionList[_questionNumber].imagePath;
  }

  List<Question> getList() => _questionList;

  bool isAtEnd() => _questionNumber == _questionList.length ? true : false;

  void bigCheck(int choice) {
    if (_questionNumber < _questionList.length) {
      if (choice == _questionList[_questionNumber].answer) {
        _score++;
        if (_score > _highScore) {
          incrementCounter();
        } // please no NPE
        showToastWidget(CorrectToast());
      } else {
        LivesIcon().removeIcon();
        showToastWidget(WrongToast());
      }
      _questionNumber++;
    } else {
      print('finished the game');
    }
  }

  int getScore() => _score;

  int getLength() => _questionList.length;

  void resetGame() {
    _questionList.shuffle();
    LivesIcon().clearList();
    _score = 0;
    _questionNumber = 0;
    LivesIcon().addIconBack();
  }
}
