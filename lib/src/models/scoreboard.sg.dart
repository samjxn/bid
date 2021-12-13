import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'scoreboard.sg.g.dart';

abstract class Scoreboard implements Built<Scoreboard, ScoreboardBuilder> {
  BuiltMap<String, BuiltList<ScoreboardEntry>> get scoreboard;

  Scoreboard._();

  int get bidCount;

  factory Scoreboard(Iterable<String> playerIds) =>
      _$Scoreboard((ScoreboardBuilder b) {
        b
          ..scoreboard = MapBuilder<String, BuiltList<ScoreboardEntry>>()
          ..bidCount = 0;

        final idsToItems = <String, ListBuilder<ScoreboardEntry>>{};
        for (final playerId in playerIds) {
          b.scoreboard[playerId] =
              ListBuilder<ScoreboardEntry>([ScoreboardEntry()]).build();
        }
      });
}

abstract class ScoreboardEntry
    implements Built<ScoreboardEntry, ScoreboardEntryBuilder> {
  int get previousScore;
  int? get bid;
  int? get tricks;
  bool get burned;

  bool get broke => tricks != null && bid != null && tricks != bid;

  ScoreboardEntry._();

  @memoized
  int get score {
    if (tricks == null || bid == null || tricks != bid) return previousScore;

    final addition = bid == 0 ? 5 : 10 + bid!;

    return previousScore + addition;
  }

  factory ScoreboardEntry({int previousScore = 0, int? bid, int? tricks}) =>
      _$ScoreboardEntry((ScoreboardEntryBuilder b) => b
        ..previousScore = previousScore
        ..burned = false
        ..bid = bid
        ..tricks = tricks);
}
