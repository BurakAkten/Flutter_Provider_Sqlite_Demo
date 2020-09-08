import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:profe_study_case_flutter/design_system/ui_components/mission_list_item.dart';
import 'package:profe_study_case_flutter/design_system/ui_components/wave_widget.dart';
import 'package:profe_study_case_flutter/providers/user_provider.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:provider/provider.dart';
import '../router.dart';

class CustomerProgresses extends StatelessWidget {
  final GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            FlutterI18n.translate(context, "customerProgresses"),
          ),
        ),
        elevation: 10.0,
        backgroundColor: Colors.blue[500],
      ),
      body: viewModel.currentTab == 1
          ? Consumer<UserProvider>(
              builder: (context, provider, child) =>
                  LayoutBuilder(builder: (context, constraint) {
                var isNoData = provider.missons == null ||
                    (provider.missons != null && provider.missons.length <= 0);
                return ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraint.maxHeight),
                  child: isNoData
                      ? Column(
                          children: [
                            WaveScreen(
                              shopInfo: provider.shop,
                            ),
                            Expanded(
                              child: Center(
                                child: provider.missons == null
                                    ? CircularProgressIndicator()
                                    : Text(
                                        FlutterI18n.translate(
                                            context, "processes.noDataMessage"),
                                      ),
                              ),
                            )
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                WaveScreen(
                                  shopInfo: provider.shop,
                                ),
                                SizedBox(height: 12),
                                Container(
                                  padding: EdgeInsets.only(left: 12, right: 12),
                                  height: constraint.maxHeight,
                                  child: ListView.builder(
                                    itemCount: provider.missons.length,
                                    itemBuilder: (context, index) {
                                      var mission = provider.missons[index];
                                      return MissionItem(
                                          title: mission.title,
                                          mission: mission.mission,
                                          time: mission.time);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                );
              }),
            )
          : Container(),
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: Colors.white,
        activeIconColor: Colors.blue[900],
        textColor: Colors.white,
        barBackgroundColor: Colors.blue[900],
        tabs: [
          TabData(
            iconData: Icons.airplanemode_active,
            title: "",
          ),
          TabData(
            iconData: Icons.call_split,
            title: FlutterI18n.translate(context, "missionAssign"),
          ),
          TabData(iconData: Icons.check, title: "")
        ],
        initialSelection: 1,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          viewModel.currentTab = position;
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.missionAssign);
          },
          tooltip: FlutterI18n.translate(context, "addMission"),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.blue[900],
        ),
      ),
    );
  }
}
