import 'package:flutter/material.dart';
import 'dart:math';

class GradientContainer extends StatefulWidget {
  const GradientContainer({super.key, required this.colors});

  final List<Color> colors;

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  var activeDiceImage = "assets/dice-images/dice-1.png";
  void getNum() {
    int number = Random().nextInt(6) + 1;
    setState(() {
      activeDiceImage = "assets/dice-images/dice-$number.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: widget.colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              activeDiceImage,
              width: 200,
            ),
            TextButton(
              onPressed: () {
                getNum();
              },
              child: const Text("Roll Dice"),
            ),
          ],
        ),
      ),
    );
  }
}
