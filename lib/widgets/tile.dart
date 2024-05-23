import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';

class Tile extends StatelessWidget {
  final int value;
  final Function onTap;
  final bool isWinningTile;

  const Tile({super.key, 
    required this.value,
    required this.onTap,
    this.isWinningTile = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: value == 0
                  ? const SizedBox()
                  : Image.asset(
                      value == 1 ? kCrossImage : kCircleImage,
                      width: 50.0,
                      height: 50.0,
                    ),
            ),
          ),
          if (isWinningTile)
            Container(
              color: Colors.green.withOpacity(0.5),
            ),
        ],
      ),
    );
  }
}

