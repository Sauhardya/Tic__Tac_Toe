import 'dart:async';
import 'package:tic_tac_toe/ai/ai.dart';
import 'package:tic_tac_toe/ai/utils.dart';

class game_presenter {
  //callbacks to ui
  void Function(int idx) showMoveOnUi;
  void Function(int idx) showGameEnd;

  Ai _aiPlayer;

  game_presenter(this.showMoveOnUi, this.showGameEnd) {
    _aiPlayer = Ai();
  }

  void onHumanPlayed(List<int> board) async {
    int evaluation = Utils.evaluateBoard(board);
    if (evaluation != Ai.NO_WINNERS_YET) {
      onGameEnd(evaluation);
      return;
    }
    //calculate the next move
    int aimove = await Future(() => _aiPlayer.play(board, Ai.AI_PLAYER));

    //perform the next move
    board[aimove] = Ai.AI_PLAYER;

    //evaluate the board after ai move
    evaluation = Utils.evaluateBoard(board);
    if (evaluation != Ai.NO_WINNERS_YET) {
      onGameEnd(evaluation);
    } else {
      showMoveOnUi(aimove);
    }
  }

  void onGameEnd(int winner) {
    showGameEnd(winner);
  }
}
