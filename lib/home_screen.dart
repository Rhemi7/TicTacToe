import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tictactoe/provider/game_provider.dart';
import 'package:tictactoe/row_builder.dart';
import 'package:tictactoe/utils/board_builder.dart';

import 'enums/player_enum.dart';


class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameVm = ref.watch(gameProvider);


    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: BoardBuilder.buildBoard(
            gameVm.matrix,
                (index, model) => RowBuilder(xIndex: index, gameProvider: gameVm),
          ),
        ),
      ),
    );
  }
}

class PlateWidget extends HookConsumerWidget {
  const PlateWidget({Key? key, required this.xIndex, required this.yIndex})
      : super(key: key);
  final int xIndex;
  final int yIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameVm = ref.watch(gameProvider);
    final value = gameVm.matrix[xIndex][yIndex];
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: value == "X"
                ? Colors.blue
                : value == "O"
                ? Colors.red
                : Colors.green,
            minimumSize: const Size.square(90),
          ),
          onPressed: () {
          },
          child: Text(value)),
    );
  }
}
