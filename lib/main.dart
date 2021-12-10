import 'package:bid/src/actions/game_actions.dart';
import 'package:bid/src/models/player.sg.dart';
import 'package:bid/src/state/state.sg.dart';
import 'package:bid/src/state/store.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

void main() async {
  final store = BidStore(initialState: BidState());

  runApp(BidApp(store));
}
