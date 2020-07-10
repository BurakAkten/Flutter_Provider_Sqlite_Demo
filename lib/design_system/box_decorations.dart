import 'package:flutter/cupertino.dart';

class ProfeBoxDecorations {
  static BoxDecoration commonBoxDecoration({Color background, Color shadow}) {
    return BoxDecoration(
      color: background,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.0),
        bottomRight: Radius.circular(8.0),
      ),
      boxShadow: [
        BoxShadow(
          color: shadow,
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(1, 1),
        ),
      ],
    );
  }
}
