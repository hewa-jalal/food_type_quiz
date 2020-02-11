import 'package:flutter/material.dart';
import 'package:food_type_quiz/components/ChoiceButton.dart';
import 'package:food_type_quiz/constants.dart';
import 'package:food_type_quiz/screens/question_bank.dart';
import 'package:oktoast/oktoast.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  QuestionBank questionBank;

  @override
  void initState() {
    super.initState();
    questionBank = QuestionBank();
    questionBank.loadCounter();
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: ToastPosition.bottom,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white24,
          body: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'High Score: ${QuestionBank().highScore}',
                  style: titleStyle,
                ),
                Container(
                  child: Image.asset(
                    'images/bird.jpg',
                  ),
                  margin:
                      EdgeInsets.only(top: 20, bottom: 14, left: 10, right: 10),
                ),
                Container(
                  height: 70,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  child: ChoiceButton(
                      btnText: 'start the quiz',
                      tap: () {
                        Navigator.of(context).pushNamed(startQuizRoute);
                      }),
                ),
                Container(
                    height: 70,
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    child: ChoiceButton(
                        btnText: 'search',
                        tap: () {
                          Navigator.of(context).pushNamed(searchRoute);
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
