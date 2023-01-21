import 'package:flutter/material.dart';
import '../variables/constants.dart';

class CardIcon extends StatelessWidget {
  final String text;
  final IconData? icon;

  CardIcon({required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: icon == null ? 0 : 70,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: kTextLabelStyle,
        ),
      ],
    );
  }
}
