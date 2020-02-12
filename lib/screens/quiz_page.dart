import 'package:flutter/material.dart';
import 'package:food_type_quiz/components/ChoiceButton.dart';
import 'package:food_type_quiz/constants.dart';

import 'question_bank.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with SingleTickerProviderStateMixin {
  QuestionBank questionBank = QuestionBank();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 14, right: 8, left: 6),
              child: TopRow(questionBank: questionBank),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Text(questionBank.getQuestionTitle(),
                        textAlign: TextAlign.center, style: titleStyle),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 20),
                    child: Image.asset(
                      questionBank.getQuestionImage(),
                      height: 180,
                    ),
                  ),
                  SizedBox(
                    height: 76,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 5),
                      child: ChoiceButton(
                        btnText: 'Fruit',
                        tap: () {
                          setState(() {
                            questionBank.bigCheck(1);
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 76,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 5),
                      child: ChoiceButton(
                        btnText: 'Vegetable',
                        tap: () {
                          setState(() {
                            questionBank.bigCheck(2);
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 76,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 5),
                      child: ChoiceButton(
                        btnText: 'Fungus',
                        tap: () {
                          setState(() {
                            questionBank.bigCheck(3);
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 76,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 5),
                      child: ChoiceButton(
                        btnText: 'Berry',
                        tap: () {
                          setState(() {
                            questionBank.bigCheck(4);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopRow extends StatelessWidget {
  const TopRow({
    Key key,
    @required this.questionBank,
  }) : super(key: key);

  final QuestionBank questionBank;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'High Score: ${questionBank.highScore}',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Text(
              'Score: ${questionBank.getScore()}',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            SizedBox(
              width: 220,
            ),
            Icon(
              Icons.audiotrack,
              size: 26,
            ),
            Icon(
              Icons.audiotrack,
              size: 26,
            ),
          ],
        )
      ],
    );
  }
}
