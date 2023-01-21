import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final VoidCallback? onPress;

  ReuseableCard({this.color, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Expanded(
        child: Container(
          child: child,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
