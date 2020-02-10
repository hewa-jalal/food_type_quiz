import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_type_quiz/screens/question_bank.dart';

import '../constants.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: SafeArea(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Colors.brown,
                  elevation: 8,
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.only(left: 12, top: 7, bottom: 7),
                    onTap: () {},
                    leading: Image.asset(QuestionBank().getImageIndex(index)),
                    title: Text(
                      QuestionBank().getQuestionTitleIndex(index),
                      textAlign: TextAlign.center,
                      style: titleStyle,
                    ),
                  ),
                );
              },
              itemCount: QuestionBank().getLength(),
            ),
          ),
        ),
      ),
    );
  }
}
