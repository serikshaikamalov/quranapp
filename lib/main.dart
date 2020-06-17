import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quranapp/core/services/localstorage.service.dart';
import 'package:quranapp/core/services/navigation.service.dart';
import 'package:quranapp/localization.dart';
import 'package:quranapp/locators.dart';
import 'package:quranapp/router.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran oqu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: Router.generateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('kk', 'KZ'),
        const Locale('ru', 'RU'),
        const Locale('en', 'US'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        LocalStorageService _storageService = locator<LocalStorageService>();

        // If user language exist in storage then load it
        if (_storageService.language != null) {
          Locale storedLocale = supportedLocales.firstWhere(
              (element) => element.languageCode == _storageService.language);
          return storedLocale;
        }

        // If not exist on storage load language that exist in the list
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            _storageService.language = supportedLocale.languageCode;
            return supportedLocale;
          }
        }

        // Default is kazakh language
        return supportedLocales.first;
      },
    );
  }
}
