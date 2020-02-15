import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_type_quiz/models/question.dart';
import 'package:food_type_quiz/models/question_bank.dart';

import '../constants.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Question> _questions = List();
  List<Question> _filteredQuestions = List();

  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _questions = QuestionBank().getList();
      _filteredQuestions = _questions;
    });
  }

  @override
  Widget build(BuildContext context) {
//    Timer(
//        Duration(milliseconds: 3000),
//        () => _controller.animateTo(_controller.position.maxScrollExtent,
//            duration: Duration(milliseconds: 1600), curve: Curves.bounceInOut));
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: SafeArea(
          child: ListView.builder(
            controller: _controller,
            itemBuilder: (context, index) {
              return index == 0 ? _searchBar() : _listItem(index - 1);
            },
            itemCount: _filteredQuestions.length + 1,
          ),
        ),
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[900], borderRadius: BorderRadius.circular(16.0)),
        margin: EdgeInsets.only(bottom: 6),
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextField(
            style: TextStyle(color: Colors.white, fontSize: 20),
            decoration: InputDecoration(
                border: InputBorder.none,
                hasFloatingPlaceholder: true,
                hintStyle: TextStyle(color: Colors.white70, fontSize: 20),
                hintText: 'Search...'),
            onChanged: (text) {
              setState(() {
                _filteredQuestions = _questions
                    .where((inputText) => (inputText.title
                        .toLowerCase()
                        .contains(text.toLowerCase())))
                    .toList();
              });
            },
          ),
        ),
      ),
    );
  }

  _listItem(index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.brown,
        elevation: 4,
        child: Column(
          children: <Widget>[
            Container(
              height: 40,
              width: double.infinity,
              child: Text(
                _questions[index].type,
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: 1.8,
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              color: Colors.green[800],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 70,
                    child: Image.asset(_filteredQuestions[index].imagePath),
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                Text(
                  _filteredQuestions[index].title,
                  textAlign: TextAlign.center,
                  style: titleStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
