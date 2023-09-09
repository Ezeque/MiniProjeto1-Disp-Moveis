import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  final List<String> items;
  String? selectedItem;
  Dropdown(this.items) {
    this.selectedItem = this.items[0];
  }

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
          margin: EdgeInsets.only(top: 20),
      child: DropdownButton(
        alignment: AlignmentDirectional.bottomStart,
        isExpanded: true,
        value: widget.selectedItem,
        items: widget.items
            .map((String item) =>
                DropdownMenuItem<String>(value: item, child: Text(item)))
            .toList(),
        onChanged: (item) {
          setState(() {
            widget.selectedItem = item!;
          });
        },
      ),
    ));
  }
}
