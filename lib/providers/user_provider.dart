import 'package:flutter/material.dart';
import 'package:profe_study_case_flutter/models/assigned_mission_data.dart';
import 'package:profe_study_case_flutter/models/customer_process.dart';
import 'package:profe_study_case_flutter/models/shop_info.dart';
import 'package:profe_study_case_flutter/utils/db_util.dart';

class UserProvider extends ChangeNotifier {
  DBHelper dbHelper;
  List<CustomerProcess> missons;
  int _customerProgressesCurrentTab = 1;
  String _selectedRole;
  String _selectedCategory;
  DateTime _selectedEndDate;
  bool _showValidateMessage = false;
  bool _showLoading = false;

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

  int get currentTab => _customerProgressesCurrentTab;
  String get selectedRole => _selectedRole;
  String get selectedCategory => _selectedCategory;
  DateTime get selectedEndDate => _selectedEndDate;
  bool get showValidateMessage => _showValidateMessage;
  bool get showLoading => _showLoading;

  set selectedRole(String role) {
    _selectedRole = role;
    notifyListeners();
  }

  set selectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  set selectedEndDate(DateTime time) {
    _selectedEndDate = time;
    notifyListeners();
  }

  set showValidateMessage(bool value) {
    _showValidateMessage = value;
    notifyListeners();
  }

  set showLoading(bool value) {
    _showLoading = value;
    notifyListeners();
  }

  set currentTab(int tabIndex) {
    _customerProgressesCurrentTab = tabIndex;
    notifyListeners();
  }

  void refreshFields() {
    selectedRole = "";
    selectedCategory = "";
    selectedEndDate = null;
    showValidateMessage = false;
    showLoading = false;
    currentTab = 1;
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
    refreshFields();
    await getMissions();
  }
}
