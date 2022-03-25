import 'package:flutter/material.dart';
import 'package:tictactoe/utils/board_builder.dart';

import '../../provider/game_provider.dart';
import '../home_screen.dart';

class RowBuilder extends StatelessWidget {
  const RowBuilder({Key? key, required this.xIndex, required this.gameProvider})
      : super(key: key);

  final int xIndex;
  final GameProvider gameProvider;

  @override
  Widget build(BuildContext context) {
    final values = gameProvider.matrix[xIndex];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: BoardBuilder.buildBoard(
          values,
              (yIndex, model) => PlateWidget(
            xIndex: xIndex,
            yIndex: yIndex,
          )),
    );
  }
}
