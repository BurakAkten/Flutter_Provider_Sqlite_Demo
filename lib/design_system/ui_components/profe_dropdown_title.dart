import 'package:flutter/material.dart';

class ProfeDropdownTitle extends StatelessWidget {
  final String title;

  const ProfeDropdownTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 16, right: 12, bottom: 2),
      child: Text(
        title,
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
    );
  }
}
