import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_type_quiz/route_generator.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      duration: Duration(milliseconds: 850),
      position: ToastPosition.bottom,
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white24,
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
