import 'package:flutter/material.dart';
import 'package:food_type_quiz/components/ChoiceButton.dart';
import 'package:food_type_quiz/constants.dart';
import 'package:food_type_quiz/models/question_bank.dart';

import '../constants.dart';
import '../models/question_bank.dart';

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
                      style: TextStyle(
                          fontSize: 38,
                          color: Colors.white,
                          fontFamily: 'Bitter'),
                    );
                  } else {
                    return Text('');
                  }
                },
              ),
              SizedBox(
                height: 36,
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
                    btnText: 'Start The Quiz',
                    tap: () {
                      Navigator.of(context).pushNamed(startQuizRoute);
                    }),
              ),
              Container(
                height: 70,
                margin: EdgeInsets.all(10),
                width: double.infinity,
                child: ChoiceButton(
                    btnText: 'Search',
                    tap: () {
                      Navigator.of(context).pushNamed(searchRoute);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Image buildPadding() {
    return Image(
      image: AssetImage(
        'images/final_vs_logo_no_circle.png',
      ),
    );
  }
}
