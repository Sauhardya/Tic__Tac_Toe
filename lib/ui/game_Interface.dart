import 'package:flutter/material.dart';
import 'package:tic_tac_toe/ai/ai.dart';
import 'package:tic_tac_toe/ui/field.dart';
import 'package:tic_tac_toe/ui/game_presenter.dart';
import 'package:gradient_text/gradient_text.dart';

class game_Interface extends StatefulWidget {
  final String title;
  game_Interface(this.title);
  @override
  _game_InterfaceState createState() => _game_InterfaceState();
}

class _game_InterfaceState extends State<game_Interface> {
  List<int> board;
  int _currentPlayer;

  game_presenter _presenter;

  _game_InterfaceState() {
    this._presenter = game_presenter(_movePlayed, _onGameEnd);
  }

  void _onGameEnd(int winner) {
    var title = "Game Over!";
    var content = "You Lose!";
    switch (winner) {
      case Ai.HUMAN: //this case will never happen because of minimax algorithm
        title = "Congratulations!";
        content = "You Won!";
        break;
      case Ai.AI_PLAYER:
        title = "Game Over!";
        content = "Alas, You Lose!";
        break;
      default:
        title = "Game Over!";
        content = "Oops! It's a Draw!";
        break;
    }
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 5),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            title: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              content,
              style: TextStyle(color: Colors.white),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  setState(() {
                    reinitialize();
                    Navigator.of(context).pop();
                  });
                },
                child: Text(
                  "Play Again!",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          );
        });
  }

  void _movePlayed(int idx) {
    setState(() {
      board[idx] = _currentPlayer;

      if (_currentPlayer == Ai.HUMAN) {
        //switch to Ai Player
        _currentPlayer = Ai.AI_PLAYER;
        _presenter.onHumanPlayed(board);
      } else {
        _currentPlayer = Ai.HUMAN;
      }
    });
  }

  String getSymbolForIndex(int index) {
    return Ai.SYMBOLS[board[index]];
  }

  @override
  void initState() {
    super.initState();
    reinitialize();
  }

  void reinitialize() {
    _currentPlayer = Ai.HUMAN;
    //generate the initial board
    board = List.generate(9, (idx) => 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.pink),
          title: Text(
            "Tic Tac Toe",
            style: TextStyle(fontSize: 20, color: Color(0xffd53369)),
          ),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(60),
              child: Center(
                child: Text(
                  "You Are Playing as X",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            Expanded(
                child: GridView.count(
              crossAxisCount: 3,
              //generate the widgets that will display the board
              children:
                  //generate the widgets that will display the board
                  List.generate(9, (idx) {
                return Field(
                    idx: idx,
                    onTap: _movePlayed,
                    playerSymbol: getSymbolForIndex(idx));
              }),
            ))
          ],
        ),
      ),
    );
  }
}
