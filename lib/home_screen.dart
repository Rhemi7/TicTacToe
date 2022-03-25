import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

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
              children: const [
                PlateWidget(),
                PlateWidget(), PlateWidget(),
                // Size.square(90);
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                PlateWidget(),
                PlateWidget(),
                PlateWidget(),
                // Size.square(90);
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                PlateWidget(),
                PlateWidget(),
                PlateWidget(),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            minimumSize: const Size.square(90),
          ),
          onPressed: () {},
          child: Text("")),
    );
  }
}
