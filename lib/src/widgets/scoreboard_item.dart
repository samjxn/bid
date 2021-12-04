import 'package:bid/src/models/scoreboard.sg.dart';
import 'package:flutter/material.dart';

class ScoreboardItem extends StatelessWidget {
  final ScoreboardEntry entry;

  const ScoreboardItem(this.entry, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text('${entry.bid ?? 0}')],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('${entry.score}')],
        )
      ],
    );
  }
}
