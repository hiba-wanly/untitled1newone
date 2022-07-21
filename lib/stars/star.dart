import 'package:flutter/material.dart';

class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({required this.value })
      : assert(value != null);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}