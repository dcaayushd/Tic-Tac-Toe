import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GameScreen(isMultiplayer: true),
                  ),
                );
              },
              child: const Text('Multiplayer'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GameScreen(isMultiplayer: false),
                  ),
                );
              },
              child: const Text('Single Player'),
            ),
          ],
        ),
      ),
    );
  }
}
