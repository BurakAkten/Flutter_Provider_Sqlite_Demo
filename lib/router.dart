import 'package:flutter/material.dart';
import 'package:profe_study_case_flutter/pages/customer_progresses.dart';
import 'package:profe_study_case_flutter/pages/mission_assign.dart';
import 'package:profe_study_case_flutter/pages/root.dart';

class Routes {
  static String get root => "/";
  static String get customerProgresses => "/customerProgresses";
  static String get missionAssign => "/missionAssign";
}

Map<String, Widget> routes = {
  Routes.root: RootPage(),
  Routes.customerProgresses: CustomerProgresses(),
  Routes.missionAssign: MissionAssign()
};

Route<dynamic> generateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) => routes[settings.name],
  );
}
