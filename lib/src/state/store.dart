import 'package:bid/src/reducers/game_reducers.dart';
import 'package:bid/src/reducers/scoreboard_reducers.dart';
import 'package:redux/redux.dart';
import 'package:bid/src/state/state.sg.dart';

class BidStore extends Store<BidState> {
  BidStore({required BidState initialState})
      : super(
          bidStateReducer,
          initialState: initialState,
          middleware: gameMiddleware,
        );
}

Reducer<BidState> bidStateReducer = combineReducers<BidState>([
  gameReducer,
  scoreboardReducer,
]);
