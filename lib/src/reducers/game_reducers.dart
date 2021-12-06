import 'package:bid/src/actions/game_actions.dart';
import 'package:bid/src/actions/scoreboard_actions.dart';
import 'package:bid/src/state/store.dart';
import 'package:redux/redux.dart';
import 'package:bid/src/state/state.sg.dart';

Reducer<BidState> gameReducer = combineReducers<BidState>([
  TypedReducer<BidState, UpdateBidder>(_nextBidder),
  TypedReducer<BidState, UpdateDealer>(_nextDealer),
]);

BidState _nextBidder(BidState state, UpdateBidder _) {
  final stateBuilder = state.toBuilder();
  stateBuilder.game.bidderIndex = state.game.nextBidder;

  return stateBuilder.build();
}

BidState _nextDealer(BidState state, UpdateDealer _) {
  final stateBuilder = state.toBuilder();
  stateBuilder.game.dealerIndex = state.game.nextDealer;
  stateBuilder.game.bidderIndex =
      (state.game.nextDealer + 1) % state.game.players.length;
  stateBuilder.game.round = state.game.round + 1;

  return stateBuilder.build();
}

List<Middleware<BidState>> gameMiddleware = [
  TypedMiddleware<BidState, NextHand>(_onNextHand),
];

void _onNextHand(Store<BidState> store, NextHand _, NextDispatcher next) {
  store.dispatch(PrepareNextRow());
  store.dispatch(UpdateDealer());
}
