import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:profe_study_case_flutter/providers/user_provider.dart';
import 'package:profe_study_case_flutter/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Runner());
}

class Runner extends StatelessWidget {
  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
    useCountryCode: false,
    fallbackFile: 'tr',
    path: 'assets/langs',
    forcedLocale: Locale('tr'),
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        initialRoute: Routes.root,
        onGenerateRoute: generateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        supportedLocales: [Locale("tr")],
        localizationsDelegates: [
          flutterI18nDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback:
            (Locale locale, Iterable<Locale> supportedLocales) {
          return Locale("tr");
        },
      ),
    );
  }
}
/*
FutureBuilder(
                      future: provider.getMissions(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data.length == 0) {
                            return Column(
                              children: [
                                WaveScreen(
                                  shopInfo: provider.shop,
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(FlutterI18n.translate(
                                        context, "processes.noDataMessage")),
                                  ),
                                )
                              ],
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  WaveScreen(
                                    shopInfo: provider.shop,
                                  ),
                                  SizedBox(height: 12),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 12, right: 12),
                                    height: constraint.maxHeight,
                                    child: ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        var mission = snapshot.data[index];
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
                          );
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      }),
                

*/
