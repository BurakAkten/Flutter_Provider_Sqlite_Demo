import 'package:flutter/material.dart';
import 'package:profe_study_case_flutter/models/assigned_mission_data.dart';
import 'package:profe_study_case_flutter/models/customer_process.dart';
import 'package:profe_study_case_flutter/models/shop_info.dart';
import 'package:profe_study_case_flutter/utils/db_util.dart';

class UserProvider extends ChangeNotifier {
  DBHelper dbHelper;
  List<CustomerProcess> missons;

  ShopInfo shop = ShopInfo(
      info: "PASTAHANE(<50M2)",
      number: "50003612",
      name: "Burak BUFE",
      ownerName: "Burak AKTEN",
      city: "ISTANBUL",
      province: "DUDULLU");

  UserProvider() {
    dbHelper = DBHelper();
    getMissions();
  }

  Future getMissions() async {
    var missonsFromDB = await dbHelper.getMissions();
    if (missonsFromDB.length > 0) {
      missons = missonsFromDB
          .map((value) => CustomerProcess(
              time: value.time.toString(),
              title: value.category,
              mission: value.role))
          .toList();
    } else {
      missons = [];
    }
    notifyListeners();
  }

  Future<void> insertMission(AssignedMissionData mission) async {
    var _ = dbHelper.insertMission(mission);
    await getMissions();
  }
}
