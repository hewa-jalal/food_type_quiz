import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_type_quiz/search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white24,
          body: QuizPage(),
          bottomNavigationBar: CurvedNavigationBar(
            animationDuration: Duration(milliseconds: 200),
            color: Colors.white60,
            backgroundColor: Colors.white24,
            buttonBackgroundColor: Colors.brown[500],
            height: 52,
            items: <Widget>[
              Icon(
                Icons.home,
                size: 40,
              ),
              Icon(
                Icons.search,
                size: 40,
              )
            ],
            onTap: (index) {
              setState(() {
                switch (index) {
                  case 0:
                    print(index);
                    break;
                  case 1:
                    SearchPage();
                    break;
                }
              });
            },
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, left: 50, right: 50, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Row(
              children: <Widget>[
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
          Center(
            child: Text(
              'Coconut',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 38,
                color: Colors.white,
                fontFamily: 'Qartella',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: Image.asset(
              'images/coconut.png',
              height: 180,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.2,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: getButton('Fruit'),
            ),
          ),
          SizedBox(
            height: 76,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: getButton('Vegetable'),
            ),
          ),
          SizedBox(
            height: 76,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: getButton('Fungus'),
            ),
          ),
          SizedBox(
            height: 76,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
              child: getButton('Berry'),
            ),
          ),
        ],
      ),
    );
  }
}

FlatButton getButton(String btnText) {
  return FlatButton(
    child: Text(
      btnText,
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 34,
          fontFamily: 'Qartella'),
    ),
    onPressed: () {},
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(80),
      side: BorderSide(color: Colors.yellow[900], width: 2.6),
    ),
    color: Colors.green[800],
  );
}
