import 'package:flutter/material.dart';
import 'piece.dart';
import 'package:get_it/get_it.dart';
import 'logic.dart';

final logic = GetIt.instance<GameLogic>();

class PlayerBar extends StatelessWidget {
  final bool isMe;
  final PieceColor color;

  const PlayerBar(this.isMe, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    final isMyTurn = color == (logic.turn());
    final pieceScore = logic.getRelScore(color);
    final eaten = color == PieceColor.BLACK ? logic.eatenBlack : logic.eatenWhite;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(color: Theme.of(context).dividerColor),
      child: ListView(primary: false, shrinkWrap: true, children: [
        Text((isMe ? "You" : "Opponent") + (pieceScore > 0 ? " +$pieceScore" : ""),
            style: TextStyle(fontWeight: isMyTurn ? FontWeight.bold : FontWeight.normal, fontSize: 20)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 20),
            child: Wrap(
                children: eaten
                    .map((pieceType) =>
                        SizedBox(width: 20, height: 20, child: PieceWidget(piece: Piece(pieceType, color))))
                    .toList()),
          ),
        )
      ]),
    );
  }
}
