import 'package:bid/src/models/game.sg.dart';
import 'package:bid/src/state/state.sg.dart';
import 'package:bid/src/state/store.dart';
import 'package:bid/src/widgets/scoreboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class BidApp extends StatelessWidget {
  final BidStore _store;
  const BidApp(this._store, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
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
        body: ScoreboardWidget(
          game.scoreboard,
          Map.fromIterable(game.players, key: (p) => p.id),
        ),
      ),
      converter: (store) => store.state.game,
    );
  }
}
