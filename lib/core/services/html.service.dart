import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

/*
  Convert html string to html widget
*/
class HtmlService {
  /*
    '' => Html(Widget)
  */
  static Widget convertToHtml(String text) {
    return Html(
      data: text,
    );
  }
}
