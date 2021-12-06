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

  int? get nextBidder =>
      bidderIndex == null ? null : (bidderIndex! + 1) % players.length;

  int get nextDealer => (dealerIndex + 1) % players.length;

  bool get isBidding => bidderIndex != null;

  int get round;

  Game._();

  factory Game(List<Player> players, {required Player dealer}) {
    final dealerPosition = max(players.indexOf(dealer), 0);
    final bidderPosition = (dealerPosition + 1) % players.length;

    return _$Game((GameBuilder b) => b
      ..scoreboard = Scoreboard(players.map((e) => e.id)).toBuilder()
      ..players = ListBuilder(players)
      ..dealerIndex = dealerPosition
      ..bidderIndex = bidderPosition);
  }
}
