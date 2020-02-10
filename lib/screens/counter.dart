import 'package:shared_preferences/shared_preferences.dart';

class Counter {
  int _counter = 0;

  loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = (prefs.getInt('counter') ?? 0);
  }

  incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = (prefs.getInt('counter') ?? 0) + 1;
  }

  int getScore() => _counter;
}
