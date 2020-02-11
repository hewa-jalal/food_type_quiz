import 'package:flutter/material.dart';
import 'package:food_type_quiz/constants.dart';
import 'package:food_type_quiz/screens/first_page.dart';
import 'package:food_type_quiz/screens/quiz_page.dart';
import 'package:food_type_quiz/screens/search_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => FirstPage());
      case startQuizRoute:
        return MaterialPageRoute(builder: (_) => QuizPage());
      case searchRoute:
        return MaterialPageRoute(
          builder: (_) => SearchPage(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('Error'),
          ),
        );
      },
    );
  }
}
