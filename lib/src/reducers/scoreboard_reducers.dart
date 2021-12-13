import 'package:bid/src/actions/scoreboard_actions.dart';
import 'package:bid/src/models/scoreboard.sg.dart';
import 'package:redux/redux.dart';
import 'package:bid/src/state/state.sg.dart';

Reducer<BidState> scoreboardReducer = combineReducers<BidState>([
  TypedReducer<BidState, SetBid>(_setBid),
  TypedReducer<BidState, SetPlayersTrickCounts>(_setPlayersTrickCounts),
  TypedReducer<BidState, PrepareNextRow>(_prepareNextRow),
]);

BidState _setBid(BidState state, SetBid action) {
  final stateBuilder = state.toBuilder();
  final player = action.bidder;

  final scoreboardState = state.game!.scoreboard;
  final playerScores = scoreboardState.scoreboard[player.id]?.toBuilder();

  stateBuilder.game.scoreboard.bidCount =
      state.game!.scoreboard.bidCount + action.bid;

  if (playerScores == null) {
    throw StateError('Player scores not found: ${player.name}');
  }

  final scoreEntryBuilder = playerScores.removeLast().toBuilder();
  scoreEntryBuilder.bid = action.bid;
  playerScores.add(scoreEntryBuilder.build());

  stateBuilder.game.scoreboard.scoreboard[player.id] = playerScores.build();

  return stateBuilder.build();
}

BidState _setPlayersTrickCounts(BidState state, SetPlayersTrickCounts action) {
  final stateBuilder = state.toBuilder();
  final scoreboardState = state.game!.scoreboard;
  final playersToTricks = action.playersToTricks;

  for (final player in action.playersToTricks.keys) {
    final playerScores = scoreboardState.scoreboard[player.id]?.toBuilder();
    if (playerScores == null) continue;

    final scoreEntryBuilder = playerScores.removeLast().toBuilder();

    final playerTricks = playersToTricks[player];
    scoreEntryBuilder.tricks = playerTricks ?? 0;
    playerScores.add(scoreEntryBuilder.build());

    stateBuilder.game.scoreboard.scoreboard[player.id] = playerScores.build();
  }

  return stateBuilder.build();
}

BidState _prepareNextRow(BidState state, PrepareNextRow _) {
  final stateBuilder = state.toBuilder();

  stateBuilder.game.scoreboard.bidCount = 0;

  final scoreboardState = state.game!.scoreboard;
  for (final player in state.game!.players) {
    final playerScores = scoreboardState.scoreboard[player.id]?.toBuilder();
    if (playerScores == null) continue;

    final finishedScoreEntry = playerScores.last;

    playerScores.add(ScoreboardEntry(previousScore: finishedScoreEntry.score));

    stateBuilder.game.scoreboard.scoreboard[player.id] = playerScores.build();
  }

  return stateBuilder.build();
}
