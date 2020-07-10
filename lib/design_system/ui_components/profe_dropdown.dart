import 'package:flutter/material.dart';

import '../box_decorations.dart';

class ProfeDropdown extends StatefulWidget {
  final String hint;
  final List<DropdownMenuItem> items;
  final Function onPressed;

  const ProfeDropdown({
    Key key,
    this.hint,
    this.items,
    this.onPressed,
  }) : super(key: key);

  @override
  _ProfeDropdownState createState() => _ProfeDropdownState();
}

class _ProfeDropdownState extends State<ProfeDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Container(
        decoration: ProfeBoxDecorations.commonBoxDecoration(
            background: Colors.white, shadow: Colors.blue),
        child: DropdownButtonFormField(
          items: widget.items,
          style:
              TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
          hint: Text(
            widget.hint,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          onChanged: (value) {
            widget.onPressed(value);
          },
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 8, right: 8)),
          validator: (value) {
            if (value == null) {
              return "";
            }
            return null;
          },
        ),
      ),
    );
  }
}
