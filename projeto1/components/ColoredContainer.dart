import 'package:flutter/material.dart';

class ColoredContainer extends StatelessWidget {
  final int size;
  final Color color;
  const ColoredContainer(this.size, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (size * 0.25),
      height: MediaQuery.of(context).size.height * (0.1666),
      decoration: BoxDecoration(color: color),
    );
  }
}
