import 'dart:math';

import 'package:bid/src/models/player.sg.dart';
import 'package:bid/src/models/scoreboard.sg.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'game.sg.g.dart';

abstract class Game implements Built<Game, GameBuilder> {
  Scoreboard get scoreboard;

  BuiltList<Player> get players;

  int get dealerIndex;
  int? get bidderIndex;

  int? get nextBidder {
    if (bidderIndex == dealerIndex) return null;

    return bidderIndex == null ? null : (bidderIndex! + 1) % players.length;
  }

  int get nextDealer => (dealerIndex + 1) % players.length;

  bool get isBidding => bidderIndex != null;

  int get round;

  @memoized
  int get hand => round <= 6 ? 7 - round : round - 6;

  Game._();

  factory Game(List<Player> players, {required int dealerPosition}) {
    return _$Game((GameBuilder b) => b
      ..scoreboard = Scoreboard(players.map((e) => e.id)).toBuilder()
      ..players = ListBuilder(players)
      ..dealerIndex = dealerPosition
      ..bidderIndex = (dealerPosition + 1) % players.length
      ..round = 0);
  }
}
