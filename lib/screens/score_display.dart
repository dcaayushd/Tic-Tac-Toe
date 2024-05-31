import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScoreDisplay extends StatelessWidget {
  final int oScore;
  final int xScore;

  const ScoreDisplay({
    super.key,
    required this.oScore,
    required this.xScore,
  });

  @override
  Widget build(BuildContext context) {
    final customFontWhite = GoogleFonts.coiny(
      textStyle: const TextStyle(
        color: Colors.white,
        letterSpacing: 3,
        fontSize: 28,
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Player O',
              style: customFontWhite,
            ),
            Text(
              oScore.toString(),
              style: customFontWhite,
            ),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Player X',
              style: customFontWhite,
            ),
            Text(
              xScore.toString(),
              style: customFontWhite,
            ),
          ],
        ),
      ],
    );
  }
}
