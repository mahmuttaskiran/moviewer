import 'package:flutter/material.dart';

const searchInputHintTextStyle = InputDecoration(
  hintText: 'Search a movie',
  hintStyle: TextStyle(fontSize: 30),
  border: InputBorder.none,
  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
);

const textFieldStyle = TextStyle(fontSize: 30);

final movieTitleGradientDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Colors.black.withOpacity(0.8),
      Colors.black.withOpacity(0.0),
    ],
  ),
);