import 'package:flutter/material.dart';
import 'package:food_type_quiz/components/lives_icon.dart';
import 'package:food_type_quiz/models/question_bank.dart';

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
