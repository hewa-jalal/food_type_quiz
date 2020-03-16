import 'package:admob_flutter/admob_flutter.dart';
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

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: <Widget>[
              FutureBuilder(
                future: QuestionBank().loadCounter(),
                builder: (context, syncedData) {
                  if (syncedData.hasData != null) {
                    if (syncedData.data == 0)
                      return Text(
                        'Welcome to food '
                        'quiz app',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      );
                    return Text(
                      'High Score: ${syncedData.data.toString()}',
                      style: highScoreStyle,
                    );
                  } else
                    return Text('');
                },
              ),
              SizedBox(height: 36),
              Image.asset(
                'images/awesome_logo.png',
                height: 340,
              ),
              SizedBox(height: 20),
              Container(
                height: 70,
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: ChoiceButton(
                  btnText: 'Start The Quiz',
                  tap: () => Navigator.of(context).pushNamed(startQuizRoute),
                ),
              ),
              Container(
                height: 70,
                margin: EdgeInsets.all(10),
                width: double.infinity,
                child: ChoiceButton(
                  btnText: 'Search',
                  tap: () => Navigator.of(context).pushNamed(searchRoute),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Container(
            child: AdmobBanner(
              adUnitId: getBannerAdUnitId(),
              adSize: AdmobBannerSize.BANNER,
            ),
          ),
        ),
      ),
    );
  }
}
