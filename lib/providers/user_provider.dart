import 'package:flutter/material.dart';
import 'package:profe_study_case_flutter/models/assigned_mission_data.dart';
import 'package:profe_study_case_flutter/models/customer_process.dart';
import 'package:profe_study_case_flutter/models/shop_info.dart';
import 'package:profe_study_case_flutter/utils/db_util.dart';

class UserProvider extends ChangeNotifier {
  BuildContext context;
  DBHelper dbHelper;

  ShopInfo shop = ShopInfo(
      info: "PASTAHANE(<50M2)",
      number: "50003612",
      name: "Burak BUFE",
      ownerName: "Burak AKTEN",
      city: "ISTANBUL",
      province: "DUDULLU");

  UserProvider({@required this.context}) {
    dbHelper = DBHelper();
  }

  Future<List<CustomerProcess>> getMissions() async {
    var missons = await dbHelper.getMissions();

    return missons
        .map((value) => CustomerProcess(
            time: value.time.toString(),
            title: value.category,
            mission: value.role))
        .toList();
  }

  Future<int> insertMission(AssignedMissionData mission) async {
    return dbHelper.insertMission(mission);
  }
}
