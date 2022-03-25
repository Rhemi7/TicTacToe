import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/player_type_model.dart';


final gameProvider = ChangeNotifierProvider((ref) => GameProvider());

class GameProvider extends ChangeNotifier{

  String lastMove = PlayerType.noPlayer;

  static const _countMatrix = 3;


  List<List<String>> _matrix = [];
  List<List<String>> get matrix => _matrix;

  GameProvider() {
    init();
  }

  init() {
    _matrix = List.generate(_countMatrix, (index) => List.generate(_countMatrix, (index) => PlayerType.noPlayer));
  }

}