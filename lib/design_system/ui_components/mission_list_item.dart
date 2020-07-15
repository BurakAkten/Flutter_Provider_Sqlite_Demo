import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../box_decorations.dart';

class MissionItem extends StatelessWidget {
  final String title;
  final String mission;
  final String time;
  final Function onTap;

  const MissionItem(
      {Key key,
      @required this.title,
      @required this.mission,
      @required this.time,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: onTap ?? null,
        child: Container(
          height: 56,
          decoration: ProfeBoxDecorations.commonBoxDecoration(
              background: Colors.blue[50], shadow: Colors.blue[600]),
          child: Row(children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            color: Colors.blue[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      SizedBox(height: 8),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: FlutterI18n.translate(context, "missionType"),
                          style:
                              TextStyle(color: Colors.blue[400], fontSize: 10),
                        ),
                        TextSpan(
                          text: "$mission",
                          style:
                              TextStyle(color: Colors.blue[600], fontSize: 10),
                        ),
                      ])),
                    ]),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                    child: VerticalDivider(width: 2, color: Colors.blue[800]),
                  ),
                  Column(children: [
                    Icon(Icons.access_alarm),
                    SizedBox(height: 8),
                    Text(
                      "$time",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.blue[400], fontSize: 10),
                    )
                  ]),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
