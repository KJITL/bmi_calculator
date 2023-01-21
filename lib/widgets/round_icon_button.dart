import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? function;

  RoundIconButton({
    this.icon,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: function,
      elevation: 6,
      child: Icon(
        icon,
        size: 20,
      ),
      constraints: BoxConstraints.tightFor(
        width: 45,
        height: 45,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
