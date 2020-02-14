import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_type_quiz/components/ChoiceButton.dart';
import 'package:food_type_quiz/constants.dart';

import 'question_bank.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with SingleTickerProviderStateMixin {
  List<Widget> livesIcon = [
    Icon(
      FontAwesome.heart,
      size: 26,
      color: Colors.red,
    ),
    SizedBox(
      width: 10,
    ),
    Icon(
      FontAwesome.heart,
      size: 26,
      color: Colors.red,
    )
  ];

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
                activeIcons: livesIcon,
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
                    child: buildPadding('Fungus', 3),
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

  Padding buildPadding(String btnText, int checkQuestion) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
      child: ChoiceButton(
        btnText: btnText,
        tap: () {
          setState(() {
            questionBank.bigCheck(checkQuestion);
          });
        },
      ),
    );
  }
}

class TopRow extends StatelessWidget {
  const TopRow(
      {Key key, @required this.questionBank, @required this.activeIcons})
      : super(key: key);

  final List<Widget> activeIcons;

  final QuestionBank questionBank;

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
              'Score: ${questionBank.getScore()}',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            SizedBox(
              width: 214,
            ),
            Row(
              children: activeIcons,
            ),
          ],
        )
      ],
    );
  }
}
