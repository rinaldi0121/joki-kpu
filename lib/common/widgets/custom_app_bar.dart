import 'package:flutter/material.dart';

AppBar customAppBar(String title) {
  return AppBar(
    title: Text(title),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
