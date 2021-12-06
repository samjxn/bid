import 'package:bid/src/models/player.sg.dart';
import 'package:bid/src/models/scoreboard.sg.dart';
import 'package:bid/src/widgets/scoreboard_item.dart';
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

  List<TableRow> _renderRows() {
    // TODO: assign roundNumber differently. you're better than this.
    final roundNumber = _scoreboard.scoreboard.entries.first.value.length;
    final hands = [7, 6, 5, 4, 3, 2, 1, 1, 2, 3, 4, 5, 6, 7]; // this is bad.
    final rowChildren = List<List<Widget>>.generate(
        roundNumber,
        (i) => <Widget>[
              SizedBox(
                height: 50.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('${hands.removeAt(0)}'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]);
    for (final mapEntry in _scoreboard.scoreboard.entries) {
      final playerScores = mapEntry.value;
      for (final e in enumerate(playerScores)) {
        final rowNum = e.index;
        final scoreEntry = e.value;
        rowChildren[rowNum].add(
          ScoreboardItem(scoreEntry),
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
      columnWidths: const {
        0: IntrinsicColumnWidth(),
      },
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
