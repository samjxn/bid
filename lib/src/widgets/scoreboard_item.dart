import 'dart:ui';

import 'package:bid/src/models/scoreboard.sg.dart';
import 'package:flutter/material.dart';

class ScoreboardItem extends StatelessWidget {
  final ScoreboardEntry entry;

  const ScoreboardItem(this.entry, {Key? key}) : super(key: key);

  Widget buildStack() {
    return SizedBox(
      height: 50,
      child: Column(children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.directional(
                textDirection: TextDirection.ltr,
                end: 0,
                top: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 1.5),
                      child: Text(
                        '${entry.bid ?? 0}',
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${entry.score}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildStack();
  }
}
