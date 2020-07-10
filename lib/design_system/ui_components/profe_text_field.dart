import 'package:flutter/material.dart';

import '../box_decorations.dart';

class ProfeTextFiled extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxlines;
  final bool isEditable;
  final Icon suffixIcon;

  const ProfeTextFiled(
      {Key key,
      @required this.controller,
      @required this.hintText,
      @required this.suffixIcon,
      this.maxlines = 1,
      this.isEditable = true})
      : super(key: key);

  @override
  _ProfeTextFiledState createState() => _ProfeTextFiledState();
}

class _ProfeTextFiledState extends State<ProfeTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: Container(
        decoration: ProfeBoxDecorations.commonBoxDecoration(
            background: Colors.white, shadow: Colors.blue),
        child: TextFormField(
          controller: widget.controller,
          enabled: widget.isEditable,
          maxLines: widget.maxlines,
          keyboardType: TextInputType.text,
          style:
              TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold),
          validator: (value) {
            if (value.length < 1) {
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 22, horizontal: 12),
              suffixIcon: widget.suffixIcon),
        ),
      ),
    );
  }
}
