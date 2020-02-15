import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LivesIcon extends StatelessWidget {
  static final List<Padding> livesIcon = [heartIcon(0), heartIcon(12)];

  static Padding heartIcon(double paddingLeft) {
    return Padding(
      padding: EdgeInsets.only(left: paddingLeft),
      child: Icon(
        FontAwesome.heart,
        size: 26,
        color: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: livesIcon,
    );
  }

  void addIconBack() {
    livesIcon.add(heartIcon(0));
    livesIcon.add(heartIcon(12));
  }

  void removeIcon() {
    if (livesIcon.isNotEmpty) {
      livesIcon.removeLast();
    }
  }
}
