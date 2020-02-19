import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_type_quiz/components/ChoiceButton.dart';
import 'package:food_type_quiz/components/lives_icon.dart';
import 'package:food_type_quiz/constants.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/getflutter.dart';

import '../models/question_bank.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with SingleTickerProviderStateMixin {
  QuestionBank questionBank = QuestionBank();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 24, right: 10, left: 10),
              child: TopRow(
                questionBank: questionBank,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Text(questionBank.getQuestionTitle(),
                        textAlign: TextAlign.center, style: titleStyle),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 20),
                    child: Image.asset(
                      questionBank.getQuestionImage(),
                      height: 180,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    height: 76,
                    child: buildPadding('Fruit', 1),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 76,
                    child: buildPadding('Vegetable', 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // method for providing padding and checking the answer
  Padding buildPadding(String btnText, int checkQuestion) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
      child: ChoiceButton(
        btnText: btnText,
        tap: () {
          setState(() {
            questionBank.bigCheck(checkQuestion);
            if (LivesIcon.livesIcon.length == 0) {
              QuestionBank().resetGame();
              endGameDialog(
                  'You are out of lives', 'images/sad_tomato.png', context);
            }
            if (QuestionBank().isAtEnd()) {
              QuestionBank().resetGame();
              endGameDialog('Congratulation you finished the game',
                  'images/happy_tomato.png', context);
            }
          });
        },
      ),
    );
  }
}

Future<bool> endGameDialog(title, imagePath, context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          // back button won't exit the dialog
          // ignore: missing_return
          onWillPop: () {},
          child: Dialog(
            backgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 350,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 60,
                    width: double.infinity,
                    color: Colors.brown,
                    child: Center(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 140,
                    child: Image.asset(
                      imagePath,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // button columns
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        GFButton(
                          color: Colors.green[900],
                          child: Text('Play Again'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          shape: GFButtonShape.pills,
                        ),
                        GFButton(
                          color: Colors.green[900],
                          shape: GFButtonShape.pills,
                          child: Text('Go Back Home'),
                          onPressed: () {
                            Navigator.pushNamed(context, homeRoute);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

class TopRow extends StatefulWidget {
  TopRow({Key key, this.questionBank}) : super(key: key);

  final QuestionBank questionBank;

  @override
  _TopRowState createState() => _TopRowState();
}

class _TopRowState extends State<TopRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'High Score: ${QuestionBank().getHighScore()}',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        SizedBox(
          height: 14,
        ),
        Row(
          children: <Widget>[
            Text(
              'Score: ${widget.questionBank.getScore()}',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            SizedBox(
              width: 200,
            ),
            Row(children: LivesIcon.livesIcon),
          ],
        ),
      ],
    );
  }
}
