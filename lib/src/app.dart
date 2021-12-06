import 'package:bid/src/models/game.sg.dart';
import 'package:bid/src/state/state.sg.dart';
import 'package:bid/src/state/store.dart';
import 'package:bid/src/widgets/scoreboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_redux/flutter_redux.dart';

import 'widgets/game_input.dart';

class BidApp extends StatelessWidget {
  final BidStore _store;
  const BidApp(this._store, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: material.Colors.grey,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<BidState, Game>(
      builder: (context, game) => Scaffold(
        appBar: AppBar(
          title: Title(
            color: material.Colors.grey,
            child: const Text('Bid Your Tricks'),
          ),
        ),
        body: Column(
          children: [
            ScoreboardWidget(
              game.scoreboard,
              {for (final p in game.players) p.id: p},
            ),
            GameInput(game),
          ],
        ),
      ),
      converter: (store) => store.state.game,
    );
  }
}
