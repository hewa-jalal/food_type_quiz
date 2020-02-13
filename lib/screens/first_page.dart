import 'package:flutter/material.dart';
import 'package:food_type_quiz/components/ChoiceButton.dart';
import 'package:food_type_quiz/constants.dart';
import 'package:food_type_quiz/screens/question_bank.dart';

import '../constants.dart';
import 'question_bank.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white24,
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FutureBuilder(
                future: QuestionBank().loadCounter(),
                builder: (BuildContext context, AsyncSnapshot<int> syncedData) {
                  if (syncedData.hasData != null) {
                    if (syncedData.data == 0) {
                      return Text('');
                    }
                    return Text(
                      'High Score: ${syncedData.data.toString()}',
                      style: titleStyle,
                    );
                  } else {
                    return Text('');
                  }
                },
              ),
              SizedBox(
                height: 76,
              ),
              buildPadding(),
              SizedBox(
                height: 30,
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
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Image(
        image: AssetImage(
          'images/logoDesigne7crop.png',
        ),
      ),
    );
  }
}
