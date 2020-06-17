import 'package:flutter/material.dart';
import 'package:quranapp/core/data/routes.dart';
import 'package:quranapp/features/quran/presentations/pages/quran-sura-list.page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;

    switch (settings.name) {
      // Home page
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => QuranSuraListPage(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
