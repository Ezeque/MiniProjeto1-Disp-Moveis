import 'package:flutter/material.dart';
import 'package:miniprojeto1/components/ColoredContainer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        Row(
          children: [
            ColoredContainer(3, Colors.red),
            ColoredContainer(1, Colors.green),
          ],
        ),
        Row(
          children: [
            ColoredContainer(2, Colors.red),
            ColoredContainer(1, Colors.blue),
            ColoredContainer(1, Colors.yellow)
          ],
        ),
        Row(
          children: [
            ColoredContainer(1, Colors.red),
            ColoredContainer(1, Colors.green),
            ColoredContainer(2, Colors.yellow)
          ],
        ),
        Row(
          children: [
            ColoredContainer(1, Colors.blue),
            ColoredContainer(3, Colors.yellow),
          ],
        ),
        Row(
          children: [
            ColoredContainer(2, Colors.green),
            ColoredContainer(1, Colors.red),
            ColoredContainer(1, Colors.yellow)
          ],
        ),
        Row(
          children: [
            ColoredContainer(3, Colors.green),
            ColoredContainer(1, Colors.blue)
          ],
        ),
      ],
    ));
  }
}
