import 'package:flutter/material.dart';

class FutureService {
  static doDelay({@required int seconds}) async {
    await Future.delayed(Duration(seconds: seconds));
  }
}
