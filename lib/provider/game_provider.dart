import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/player_type_model.dart';


final gameProvider = ChangeNotifierProvider((ref) => GameProvider());

class GameProvider extends ChangeNotifier{

  //Checks to know who the last player to make a move.
  //It is initialized to no player by default

  String lastMove = PlayerType.noPlayer;

  static const _countMatrix = 3;

  //Keeps track of the total number of moves made by both players
  int totalMoves = 0;

  List<List<String>> _matrix = [];
  List<List<String>> get matrix => _matrix;

  //This is used to check whenever there is a winnner
  late bool _isGameOver;
  bool get isGameOver => _isGameOver;

  GameProvider() {
    init();
  }

  //Initializing of the generated board
  init() {
    _matrix = List.generate(_countMatrix, (index) => List.generate(_countMatrix, (index) => PlayerType.noPlayer));
    totalMoves = 0;
    _isGameOver = false;
  }

  //Function updates a square when it is tapped
  void plateTapped(String value, int row, int column) {
    if (value == PlayerType.noPlayer) {
      final newValue = lastMove == PlayerType.playerX ? PlayerType.playerO : PlayerType.playerX;
      lastMove = newValue;

      _matrix[row][column] = newValue;

      if(getWinner(row, column)) {
        _isGameOver = true;
      }

      notifyListeners();
    }
  }


  //This function returns a bool to decide who the winner is
  bool getWinner(int x, int y) {
    int column = 0, row = 0, diag = 0, crossDiagonal = 0;

    final player = _matrix[x][y];

    const n = _countMatrix;

    for (int i = 0; i < n; i++) {
      if (_matrix[x][i] == player) row++;

      if (_matrix[i][y] == player) column++;

      if (_matrix[i][i] == player) diag++;

      if(_matrix[i][_countMatrix - 1 - 1] == player) crossDiagonal++;
    }

    return row == n  || column == n|| diag == n || crossDiagonal == n;
  }


}