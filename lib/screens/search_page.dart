import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_type_quiz/screens/question.dart';
import 'package:food_type_quiz/screens/question_bank.dart';

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
//        () => _controller.animateTo(_controller.position.minScrollExtent,
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
      padding: const EdgeInsets.all(4.0),
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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.brown,
      elevation: 4,
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 12, top: 7, bottom: 7),
        leading: Image.asset(_filteredQuestions[index].imagePath),
        title: Text(
          _filteredQuestions[index].title,
          textAlign: TextAlign.center,
          style: titleStyle,
        ),
      ),
    );
  }
}
