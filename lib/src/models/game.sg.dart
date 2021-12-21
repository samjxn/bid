import 'package:bid/src/models/player.sg.dart';
import 'package:bid/src/models/scoreboard.sg.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'game.sg.g.dart';

enum GameStatus {
  bidding,
  postBidding,
  trickEntry,
  finished,
}

abstract class Game implements Built<Game, GameBuilder> {
  Scoreboard get scoreboard;

  BuiltList<Player> get players;

  int get dealerIndex;
  int? get bidderIndex;

  Future<void>? get setBidCompleter;

  GameStatus get status;

  @memoized
  int? get nextBidder {
    if (bidderIndex == dealerIndex) return null;

    return bidderIndex == null ? null : (bidderIndex! + 1) % players.length;
  }

  @memoized
  int? get previousBidder {
    if (bidderIndex == null) return dealerIndex;

    final previousBidderIndex = (bidderIndex! - 1) % players.length;
    if (previousBidderIndex == dealerIndex) return null;

    return previousBidderIndex;
  }

  @memoized
  int get nextDealer => (dealerIndex + 1) % players.length;

  @memoized
  bool get isBidding => bidderIndex != null || GameStatus.postBidding == status;

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
      ..round = 0
      ..status = GameStatus.bidding);
  }
}
