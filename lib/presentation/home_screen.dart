import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tictactoe/presentation/widgets/pop_up_dialog.dart';
import 'package:tictactoe/presentation/widgets/row_builder.dart';
import 'package:tictactoe/provider/game_provider.dart';
import 'package:tictactoe/utils/board_builder.dart';

import '../enums/player_enum.dart';


class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameVm = ref.watch(gameProvider);

    //Snackbar to show when there is a draw
    void showInSnackBar(String value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(value),
        ),
      );
    }

    //Dialog to show when there is a winner
    showWinnerDialog(String winner) {
      showDialog(
          context: context,
          builder: (context) {
            return PopUpDialog(player: winner);
          });
      ref.read(gameProvider).init();
    }

    //Listens to events from UI so as to make the necessary triggers
    ref.listen<GameProvider>(gameProvider, (p, provider) {
      if (provider.isGameOver) {
        showWinnerDialog(provider.lastMove);
      } else if (provider.isGameOver == false && provider.totalMoves == 9) {
        showInSnackBar("It is a draw");
        ref.read(gameProvider).init();
      }
    });

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tic Tac Toe'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: BoardBuilder.buildBoard(
            gameVm.matrix,
                (index, model) => RowBuilder(xIndex: index, gameProvider: gameVm),
          ),
        ),
      ),
    );
  }
}

