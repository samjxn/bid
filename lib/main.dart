import 'package:bid/src/state/state.sg.dart';
import 'package:bid/src/state/store.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

void main() {
  final store = BidStore(initialState: BidState());
  runApp(BidApp(store));
}
