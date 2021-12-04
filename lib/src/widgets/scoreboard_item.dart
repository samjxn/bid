import 'dart:ui';

import 'package:bid/src/models/scoreboard.sg.dart';
import 'package:flutter/material.dart';

class ScoreboardItem extends StatelessWidget {
  final ScoreboardEntry entry;

  int get bid => entry.bid ?? 0;
  int? get tricks => entry.tricks;

  bool get broke => tricks != null && bid != tricks;

  const ScoreboardItem(this.entry, {Key? key}) : super(key: key);

  Widget _renderBidAndTricks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (broke)
          Padding(
            padding: const EdgeInsets.only(right: 1.5),
            child: Text(
              '$tricks',
              style: const TextStyle(fontSize: 12.0, color: Colors.red),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(right: 1.5),
          child: Text(
            '$bid',
            style: TextStyle(
              fontSize: 12.0,
              decoration: broke ? TextDecoration.lineThrough : null,
              color: broke ? null : Colors.green,
            ),
          ),
        ),
      ],
    );
  }

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
                child: _renderBidAndTricks(),
              ),
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (broke)
                      Container(
                          padding: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.red),
                          ),
                          child: Text('${entry.score}')),
                    if (!broke) Text('${entry.score}'),
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
