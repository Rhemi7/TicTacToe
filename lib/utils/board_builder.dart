import 'package:flutter/material.dart';

//This is a class used to generate the board with matrix
class BoardBuilder {
  static List<Widget> buildBoard<T>(
      List<T> models, Function(int index, T model) builder) {
    return models
        .asMap()
        .map<int, Widget>((key, model) => MapEntry(key, builder(key, model)))
        .values
        .toList();
  }
}
