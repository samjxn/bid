import 'package:bid/src/actions/game_actions.dart';
import 'package:bid/src/actions/scoreboard_actions.dart';
import 'package:bid/src/models/game.sg.dart';
import 'package:bid/src/models/player.sg.dart';
import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:bid/src/state/state.sg.dart';

import '../models/scoreboard.sg.dart';

Reducer<BidState> gameReducer = combineReducers<BidState>([
  TypedReducer<BidState, UpdateBidder>(_nextBidder),
  TypedReducer<BidState, UpdateDealer>(_nextDealer),
  TypedReducer<BidState, PreviousBidder>(_previousBidder),
  TypedReducer<BidState, NewGame>(_newGame),
  TypedReducer<BidState, StartTricking>(_startTricking),
]);

BidState _nextBidder(BidState state, UpdateBidder _) {
  final stateBuilder = state.toBuilder();
  final nextBidder = state.game!.nextBidder;
  stateBuilder.game.bidderIndex = nextBidder;

  if (nextBidder == null) {
    stateBuilder.game.status = GameStatus.postBidding;
  }

  return stateBuilder.build();
}

BidState _previousBidder(BidState state, PreviousBidder _) {
  final stateBuilder = state.toBuilder();

  Player? bidderToRemove;
  if (state.game!.status == GameStatus.postBidding) {
    stateBuilder.game.status = GameStatus.bidding;
    bidderToRemove = state.game!.players[state.game!.dealerIndex];
  }

  bidderToRemove ??= state.game!
      .players[(state.game!.bidderIndex! - 1) % state.game!.players.length];

  final previousBidder = state.game!.previousBidder;
  stateBuilder.game.bidderIndex = previousBidder;

  if (previousBidder != null) {
    final player = state.game!.players[previousBidder];
    stateBuilder.game.scoreboard.scoreboard[player.id] = stateBuilder
        .game.scoreboard.scoreboard[player.id]!
        .rebuild(_rebuildScoreList);
  }

  return stateBuilder.build();
}

BidState _startTricking(BidState state, StartTricking _) {
  final stateBuilder = state.toBuilder();

  stateBuilder.game.status = GameStatus.trickEntry;

  return stateBuilder.build();
}

void _resetBid(ScoreboardEntryBuilder builder) {
  builder.bid = null;
}

void _rebuildScoreList(ListBuilder<ScoreboardEntry> builder) {
  final last = builder.removeLast();
  builder.add(last.rebuild(_resetBid));
}

BidState _nextDealer(BidState state, UpdateDealer _) {
  final stateBuilder = state.toBuilder();
  stateBuilder.game.dealerIndex = state.game!.nextDealer;
  stateBuilder.game.bidderIndex =
      (state.game!.nextDealer + 1) % state.game!.players.length;
  stateBuilder.game.round = state.game!.round + 1;

  return stateBuilder.build();
}

BidState _newGame(BidState state, NewGame action) {
  final stateBuilder = state.toBuilder();
  stateBuilder.game = Game(
    action.players?.toList() ?? state.game!.players.toList(),
    dealerPosition: action.dealerIndex ?? 0,
  ).toBuilder();
  return stateBuilder.build();
}

List<Middleware<BidState>> gameMiddleware = [
  TypedMiddleware<BidState, NextHand>(_onNextHand),
  TypedMiddleware<BidState, UpdateBidder>(_onUpdateBidder),
  TypedMiddleware<BidState, StartTricking>(_startTrickingMiddleware),
];

void _onNextHand(Store<BidState> store, NextHand action, NextDispatcher next) {
  store.dispatch(PrepareNextRow());
  store.dispatch(UpdateDealer());

  next(action);
}

void _onUpdateBidder(
    Store<BidState> store, UpdateBidder action, NextDispatcher next) async {
  if (store.state.game!.setBidCompleter != null) {
    await store.state.game!.setBidCompleter;
  }

  next(action);
}

void _startTrickingMiddleware(
    Store<BidState> store, StartTricking action, NextDispatcher next) {
  store.dispatch(SetPlayersTrickCounts({
    for (final player in store.state.game!.players)
      player: store.state.game!.scoreboard.scoreboard[player.id]!.last.bid!,
  }));

  next(action);
}
