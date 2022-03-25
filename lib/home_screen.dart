
import 'package:flutter/material.dart';

import 'enums/player_enum.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// List<T> listBuilder = [];
// Function(int index, T model) builder;
String value = '';
Player lastMove = Player.playerNone;
List<String> gamePlay = [];


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlateWidget(
                  onPressed: () {
                    setState(() {
                      value = lastMove == Player.playerNone ? "X" : lastMove == Player.playerX ? "Y" : "X";
                      print(value);
                      lastMove =   value == "X" ? Player.playerX : Player.playerY;
                    });
                  },
                ),
                PlateWidget(
                  onPressed: () {
                    setState(() {
                      value = lastMove == Player.playerNone ? "X" : lastMove == Player.playerX ? "Y" : "X";
                      print(value);
                      lastMove =   value == "X" ? Player.playerX : Player.playerY;
                    });
                  },
                ),
                PlateWidget(
                  onPressed: () {
                    setState(() {
                      value = lastMove == Player.playerNone ? "X" : lastMove == Player.playerX ? "Y" : "X";
                      print(value);
                      lastMove =   value == "X" ? Player.playerX : Player.playerY;
                    });
                  },
                ),
                // Size.square(90);
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                PlateWidget(
                  onPressed: () {
                    setState(() {
                      value = lastMove == Player.playerNone ? "X" : lastMove == Player.playerX ? "Y" : "X";
                      print(value);
                      lastMove =   value == "X" ? Player.playerX : Player.playerY;
                    });
                  },
                ),
                PlateWidget(
                  onPressed: () {
                    setState(() {
                      value = lastMove == Player.playerNone ? "X" : lastMove == Player.playerX ? "Y" : "X";
                      print(value);
                      lastMove =   value == "X" ? Player.playerX : Player.playerY;
                    });
                  },
                ),
                PlateWidget(
                  onPressed: () {
                    setState(() {
                      value = lastMove == Player.playerNone ? "X" : lastMove == Player.playerX ? "Y" : "X";
                      print(value);
                      lastMove =   value == "X" ? Player.playerX : Player.playerY;
                    });
                  },
                ),
                // Size.square(90);
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                PlateWidget(
                  onPressed: () {
                    setState(() {
                      value = lastMove == Player.playerNone ? "X" : lastMove == Player.playerX ? "Y" : "X";
                      print(value);
                      lastMove =   value == "X" ? Player.playerX : Player.playerY;
                    });
                  },
                ),
                PlateWidget(
                  onPressed: () {
                    setState(() {
                      value = lastMove == Player.playerNone ? "X" : lastMove == Player.playerX ? "Y" : "X";
                      print(value);
                      lastMove =   value == "X" ? Player.playerX : Player.playerY;
                    });
                  },
                ),
                PlateWidget(
                  onPressed: () {
                    setState(() {
                      value = lastMove == Player.playerNone ? "X" : lastMove == Player.playerX ? "Y" : "X";
                      print(value);
                      lastMove =   value == "X" ? Player.playerX : Player.playerY;
                    });
                  },
                ),
                // Size.square(90);
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PlateWidget extends StatelessWidget {
  const PlateWidget({
    Key? key,
    this.onPressed,

  }) : super(key: key);

  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            minimumSize: const Size.square(90),
          ) ,
          onPressed: onPressed, child: Text(value)),
    );
  }
}
