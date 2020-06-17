import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String error;

  AppError({this.error});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(this.error));
  }
}
