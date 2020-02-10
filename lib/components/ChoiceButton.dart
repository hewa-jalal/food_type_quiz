import 'package:flutter/material.dart';
import 'package:food_type_quiz/constants.dart';

class ChoiceButton extends StatelessWidget {
  ChoiceButton({this.btnText, this.tap});

  final String btnText;
  final Function tap;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        btnText,
        style: btnTextStyle,
      ),
      onPressed: tap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80),
        side: BorderSide(color: Colors.yellow[900], width: 2.6),
      ),
      color: Colors.green[800],
    );
  }
}
