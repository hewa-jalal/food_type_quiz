import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/shape/gf_button_shape.dart';

import '../constants.dart';

Future<bool> endGameDialog(context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          // ignore: missing_return
          onWillPop: () {},
          child: Dialog(
            backgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
                height: 350,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: double.infinity,
                      color: Colors.brown,
                      child: Center(
                        child: Text(
                          'You are out of lives',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 140,
                      child: Image.asset(
                        'images/sad_tomato.png',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // button columns
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          GFButton(
                            color: Colors.green[900],
                            child: Text('Play Again'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            shape: GFButtonShape.pills,
                          ),
                          GFButton(
                            color: Colors.green[900],
                            shape: GFButtonShape.pills,
                            child: Text('Go Back Home'),
                            onPressed: () {
                              Navigator.pushNamed(context, homeRoute);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
        );
      });
}
