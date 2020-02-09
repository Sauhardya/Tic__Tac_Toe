import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ui/home_screen.dart';

void main() => runApp(TicTacToe());

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homeScreen(),
      theme: ThemeData(
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.black45,
          accentColor: Colors.white70,
          textTheme: TextTheme(body1: TextStyle(color: Colors.white))),
    );
  }
}
