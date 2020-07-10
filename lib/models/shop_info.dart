import 'package:flutter/material.dart';

class ShopInfo {
  final String number;
  final String name;
  final String ownerName;
  final String city;
  final String province;
  final String info;

  ShopInfo(
      {@required this.info,
      @required this.number,
      @required this.name,
      @required this.ownerName,
      @required this.city,
      @required this.province});
}
