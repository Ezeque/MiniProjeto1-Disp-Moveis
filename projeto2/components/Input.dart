import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String placeholder;
  final _controller = TextEditingController();
  Input(this.placeholder, {super.key});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Flexible(
      child: TextField(
        controller: widget._controller,
        decoration: InputDecoration(
          hintText: widget.placeholder,
          contentPadding: EdgeInsets.symmetric(horizontal: 10)
        ),
      ),
    ));
  }
  }

