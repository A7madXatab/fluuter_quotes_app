import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String label;
  final TextStyle style;
  Label(this.label, {this.style});

  @override
  Widget build(BuildContext context) {
    return Text(this.label,
        style: Theme.of(context).textTheme.body1.merge(style));
  }
}
