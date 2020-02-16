import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/getflutter.dart';

import '../constants.dart';

class CorrectToast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: GFButton(
        padding: EdgeInsets.only(top: 2, bottom: 2, left: 6, right: 6),
        size: 65,
        borderShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Correct',
              style: titleStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.check,
              size: 60,
              color: Colors.greenAccent,
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}

class WrongToast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: GFButton(
        padding: EdgeInsets.only(top: 2, bottom: 2, left: 6, right: 6),
        size: 65,
        borderShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        color: Colors.red[500],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Wrong',
              style: titleStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.close,
              size: 60,
              color: Colors.red[900],
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
