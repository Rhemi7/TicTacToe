import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/game_provider.dart';

// A square in the board
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
            ref.read(gameProvider).plateTapped(value, xIndex, yIndex);
          },
          child: Text(value)),
    );
  }
}
