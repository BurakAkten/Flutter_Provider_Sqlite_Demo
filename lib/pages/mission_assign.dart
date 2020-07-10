import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intl/intl.dart';
import 'package:profe_study_case_flutter/design_system/box_decorations.dart';
import 'package:profe_study_case_flutter/design_system/ui_components/profe_dropdown.dart';
import 'package:profe_study_case_flutter/design_system/ui_components/profe_dropdown_title.dart';
import 'package:profe_study_case_flutter/design_system/ui_components/profe_text_field.dart';
import 'package:profe_study_case_flutter/design_system/ui_components/wave_widget.dart';
import 'package:profe_study_case_flutter/models/assigned_mission_data.dart';
import 'package:profe_study_case_flutter/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../router.dart';

class MissionAssign extends StatefulWidget {
  @override
  _MissionAssignState createState() => _MissionAssignState();
}

class _MissionAssignState extends State<MissionAssign> {
  GlobalKey<FormState> _fbKey;
  TextEditingController _descriptionController;
  TextEditingController _timeController;
  List<DropdownMenuItem> _roles;

  List<DropdownMenuItem> _categories;
  String _selectedCategory;
  String _selectedRole;
  DateTime _selectedEndDate;
  final _dateFormatter = DateFormat("dd.MM.yyyy - hh:mm");
  bool _showValidateMessage = false;
  bool _showLoading = false;

  @override
  void initState() {
    _fbKey = GlobalKey<FormState>();
    _descriptionController = TextEditingController();
    _timeController = TextEditingController();
    _roles = [
      DropdownMenuItem<String>(
        value: "Şef",
        child: new Text("Şef"),
      ),
      DropdownMenuItem<String>(
        value: "Stand",
        child: new Text("Stand"),
      )
    ];
    _categories = [
      DropdownMenuItem<String>(
        value: "Soğutcu",
        child: new Text("Soğutcu"),
      ),
      DropdownMenuItem<String>(
        value: "Isıtıcı",
        child: new Text("Isıtıcı"),
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(FlutterI18n.translate(context, "customerProgresses"))),
        elevation: 10.0,
        backgroundColor: Colors.blue[500],
      ),
      body: Consumer<UserProvider>(
        builder: (context, provider, child) => Form(
          key: _fbKey,
          child: LayoutBuilder(
            builder: (context, constraint) => ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          WaveScreen(
                            shopInfo: provider.shop,
                          ),
                          SizedBox(height: 12),
                          ProfeDropdownTitle(
                            title:
                                FlutterI18n.translate(context, "description"),
                          ),
                          ProfeTextFiled(
                            suffixIcon: Icon(
                              Icons.keyboard,
                            ),
                            maxlines: 3,
                            controller: _descriptionController,
                            hintText: FlutterI18n.translate(
                                context, "enterDescription"),
                          ),
                          SizedBox(height: 12),
                          ProfeDropdownTitle(
                            title: FlutterI18n.translate(context, "role"),
                          ),
                          ProfeDropdown(
                            items: _roles,
                            hint: FlutterI18n.translate(context, "selectRole"),
                            onPressed: (value) {
                              FocusScope.of(context).requestFocus(FocusNode());
                              setState(() {
                                _selectedRole = value.toString();
                              });
                            },
                          ),
                          SizedBox(height: 12),
                          ProfeDropdownTitle(
                            title: FlutterI18n.translate(context, "category"),
                          ),
                          ProfeDropdown(
                            items: _categories,
                            hint: FlutterI18n.translate(
                                context, "selectCategory"),
                            onPressed: (value) {
                              FocusScope.of(context).requestFocus(FocusNode());
                              setState(() {
                                _selectedCategory = value.toString();
                              });
                            },
                          ),
                          SizedBox(height: 12),
                          ProfeDropdownTitle(
                            title: FlutterI18n.translate(context, "endDate"),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2090),
                              ).then((date) async {
                                if (date != null) {
                                  await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((time) {
                                    if (time != null) {
                                      setState(() {
                                        _selectedEndDate = DateTime(
                                            date.year,
                                            date.month,
                                            date.day,
                                            time.hour,
                                            time.minute);
                                        _timeController.text = _dateFormatter
                                            .format(_selectedEndDate);
                                      });
                                    }
                                  });
                                }
                              });
                            },
                            child: ProfeTextFiled(
                              isEditable: false,
                              suffixIcon: Icon(
                                Icons.date_range,
                              ),
                              controller: _timeController,
                              hintText:
                                  FlutterI18n.translate(context, "selectTime"),
                            ),
                          ),
                          SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                  _showValidateMessage
                      ? Padding(
                          padding: EdgeInsets.only(top: 8, left: 16, right: 12),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                FlutterI18n.translate(
                                    context, "validator.fillAreas"),
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              )),
                        )
                      : Container(),
                  GestureDetector(
                    onTap: () async {
                      if (_fbKey.currentState.validate()) {
                        setState(() {
                          _showValidateMessage = false;
                          _showLoading = true;
                        });
                        var date = DateFormat("dd.MM.yyyy - hh:mm")
                            .format(_selectedEndDate);
                        var mission = AssignedMissionData(
                            description: _descriptionController.text.trim(),
                            time: date,
                            category: _selectedCategory,
                            role: _selectedRole);
                        provider.insertMission(mission);
                        setState(() {
                          _showLoading = false;
                        });
                        Navigator.pushNamedAndRemoveUntil(context,
                            Routes.customerProgresses, (route) => false);
                      } else {
                        setState(() {
                          _showValidateMessage = true;
                        });
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
                      child: Container(
                        height: 56,
                        decoration: ProfeBoxDecorations.commonBoxDecoration(
                            background: Colors.blue[900], shadow: Colors.blue),
                        child: Center(
                          child: _showLoading
                              ? CircularProgressIndicator()
                              : Text(
                                  FlutterI18n.translate(
                                      context, "sendButtonTitle"),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
