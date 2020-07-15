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
