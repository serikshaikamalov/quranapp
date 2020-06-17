import 'package:flutter/material.dart';
import 'package:quranapp/core/data/routes.dart';
import 'package:quranapp/core/services/navigation.service.dart';
import 'package:quranapp/localization.dart';
import 'package:quranapp/locators.dart';

class QuranSuraListPage extends StatefulWidget {
  @override
  _QuranSuraListPageState createState() => _QuranSuraListPageState();
}

class _QuranSuraListPageState extends State<QuranSuraListPage> {
  NavigationService _navService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate('quran')),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => _navService.navigateTo(AppRoutes.settings)),
          ],
        ),
        body: Container());
  }
}
