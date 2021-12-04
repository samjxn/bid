import 'package:bid/src/models/player.sg.dart';
import 'package:bid/src/models/scoreboard.sg.dart';
import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';

class ScoreboardWidget extends StatelessWidget {
  final Scoreboard _scoreboard;
  final Map<String, Player> _players;

  const ScoreboardWidget(
    this._scoreboard,
    this._players, {
    Key? key,
  }) : super(key: key);

  int mapRoundToHand(int round) {
    if (round < 6) return 7 - round;

    return round - 6;
  }

  List<TableRow> _renderRows() {
    final rowChildren = List<List<Widget>>.generate(
        _scoreboard.scoreboard.entries.first.value.length,
        (i) => <Widget>[(Center(child: Text(mapRoundToHand(i).toString())))]);
    for (final mapEntry in _scoreboard.scoreboard.entries) {
      final playerScores = mapEntry.value;
      for (final e in enumerate(playerScores)) {
        final rowNum = e.index;
        final scoreEntry = e.value;
        rowChildren[rowNum].add(
          Center(
            child: Text(
              'bid: ${scoreEntry.bid ?? 0}, '
              '${scoreEntry.score}'
              '${scoreEntry.broke ? ', broke' : ''}',
            ),
          ),
        );
      }
    }

    return rowChildren.map((children) => TableRow(children: children)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
          color: Colors.black, style: BorderStyle.solid, width: 2),
      children: [
        TableRow(
          children:
              _players.values.map((p) => Center(child: Text(p.name))).toList()
                ..insert(0, const Center(child: Text(''))),
        ),
        ..._renderRows(),
      ],
    );
  }
}
