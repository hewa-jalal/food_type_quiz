import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_type_quiz/components/ChoiceButton.dart';
import 'package:food_type_quiz/components/lives_icon.dart';
import 'package:food_type_quiz/constants.dart';
import 'package:food_type_quiz/screens/EndGameDialog.dart';

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
              padding: const EdgeInsets.only(top: 14, right: 10, left: 10),
              child: TopRow(
                questionBank: questionBank,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
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
                    height: 76,
                    child: buildPadding('Fruit', 1),
                  ),
                  SizedBox(
                    height: 76,
                    child: buildPadding('Vegetable', 2),
                  ),
                  SizedBox(
                    height: 76,
                    child: buildPadding('Nut', 3),
                  ),
                  SizedBox(
                    height: 76,
                    child: buildPadding('Berry', 4),
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
              endGameDialog(context);
              QuestionBank().resetGame();
            }
          });
        },
      ),
    );
  }
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
        )
      ],
    );
  }
}
