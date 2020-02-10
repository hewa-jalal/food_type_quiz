import 'package:flutter/material.dart';
import 'package:food_type_quiz/components/ChoiceButton.dart';
import 'package:food_type_quiz/constants.dart';
import 'package:food_type_quiz/screens/toasts.dart';
import 'package:oktoast/oktoast.dart';

import 'question_bank.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with SingleTickerProviderStateMixin {
  QuestionBank questionBank = QuestionBank();

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
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
                      height: MediaQuery.of(context).size.width * 0.2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 5),
                        child: ChoiceButton(
                          btnText: 'Fruit',
                          tap: () {
                            setState(() {
                              if (questionBank.validateQuestion(1)) {
                                questionBank.incrementScore();
                              }
                              questionBank.nextQuestion();
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
                              if (questionBank.validateQuestion(2)) {
                                questionBank.incrementScore();
                              }
                              showToastWidget(CorrectToast());
                              questionBank.nextQuestion();
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
                              if (questionBank.validateQuestion(4)) {
                                questionBank.incrementScore();
                              }
                              questionBank.nextQuestion();
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
                              if (questionBank.validateQuestion(4)) {
                                questionBank.incrementScore();
                              }
                              questionBank.nextQuestion();
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
      ),
    );
  }
}
