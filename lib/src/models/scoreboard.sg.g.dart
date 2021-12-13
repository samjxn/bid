// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scoreboard.sg.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Scoreboard extends Scoreboard {
  @override
  final BuiltMap<String, BuiltList<ScoreboardEntry>> scoreboard;
  @override
  final int bidCount;

  factory _$Scoreboard([void Function(ScoreboardBuilder)? updates]) =>
      (new ScoreboardBuilder()..update(updates)).build();

  _$Scoreboard._({required this.scoreboard, required this.bidCount})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        scoreboard, 'Scoreboard', 'scoreboard');
    BuiltValueNullFieldError.checkNotNull(bidCount, 'Scoreboard', 'bidCount');
  }

  @override
  Scoreboard rebuild(void Function(ScoreboardBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScoreboardBuilder toBuilder() => new ScoreboardBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Scoreboard &&
        scoreboard == other.scoreboard &&
        bidCount == other.bidCount;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, scoreboard.hashCode), bidCount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Scoreboard')
          ..add('scoreboard', scoreboard)
          ..add('bidCount', bidCount))
        .toString();
  }
}

class ScoreboardBuilder implements Builder<Scoreboard, ScoreboardBuilder> {
  _$Scoreboard? _$v;

  MapBuilder<String, BuiltList<ScoreboardEntry>>? _scoreboard;
  MapBuilder<String, BuiltList<ScoreboardEntry>> get scoreboard =>
      _$this._scoreboard ??=
          new MapBuilder<String, BuiltList<ScoreboardEntry>>();
  set scoreboard(MapBuilder<String, BuiltList<ScoreboardEntry>>? scoreboard) =>
      _$this._scoreboard = scoreboard;

  int? _bidCount;
  int? get bidCount => _$this._bidCount;
  set bidCount(int? bidCount) => _$this._bidCount = bidCount;

  ScoreboardBuilder();

  ScoreboardBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _scoreboard = $v.scoreboard.toBuilder();
      _bidCount = $v.bidCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Scoreboard other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Scoreboard;
  }

  @override
  void update(void Function(ScoreboardBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Scoreboard build() {
    _$Scoreboard _$result;
    try {
      _$result = _$v ??
          new _$Scoreboard._(
              scoreboard: scoreboard.build(),
              bidCount: BuiltValueNullFieldError.checkNotNull(
                  bidCount, 'Scoreboard', 'bidCount'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'scoreboard';
        scoreboard.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Scoreboard', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ScoreboardEntry extends ScoreboardEntry {
  @override
  final int previousScore;
  @override
  final int? bid;
  @override
  final int? tricks;
  @override
  final bool burned;
  int? __score;

  factory _$ScoreboardEntry([void Function(ScoreboardEntryBuilder)? updates]) =>
      (new ScoreboardEntryBuilder()..update(updates)).build();

  _$ScoreboardEntry._(
      {required this.previousScore,
      this.bid,
      this.tricks,
      required this.burned})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        previousScore, 'ScoreboardEntry', 'previousScore');
    BuiltValueNullFieldError.checkNotNull(burned, 'ScoreboardEntry', 'burned');
  }

  @override
  int get score => __score ??= super.score;

  @override
  ScoreboardEntry rebuild(void Function(ScoreboardEntryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ScoreboardEntryBuilder toBuilder() =>
      new ScoreboardEntryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ScoreboardEntry &&
        previousScore == other.previousScore &&
        bid == other.bid &&
        tricks == other.tricks &&
        burned == other.burned;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, previousScore.hashCode), bid.hashCode), tricks.hashCode),
        burned.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ScoreboardEntry')
          ..add('previousScore', previousScore)
          ..add('bid', bid)
          ..add('tricks', tricks)
          ..add('burned', burned))
        .toString();
  }
}

class ScoreboardEntryBuilder
    implements Builder<ScoreboardEntry, ScoreboardEntryBuilder> {
  _$ScoreboardEntry? _$v;

  int? _previousScore;
  int? get previousScore => _$this._previousScore;
  set previousScore(int? previousScore) =>
      _$this._previousScore = previousScore;

  int? _bid;
  int? get bid => _$this._bid;
  set bid(int? bid) => _$this._bid = bid;

  int? _tricks;
  int? get tricks => _$this._tricks;
  set tricks(int? tricks) => _$this._tricks = tricks;

  bool? _burned;
  bool? get burned => _$this._burned;
  set burned(bool? burned) => _$this._burned = burned;

  ScoreboardEntryBuilder();

  ScoreboardEntryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _previousScore = $v.previousScore;
      _bid = $v.bid;
      _tricks = $v.tricks;
      _burned = $v.burned;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ScoreboardEntry other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ScoreboardEntry;
  }

  @override
  void update(void Function(ScoreboardEntryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ScoreboardEntry build() {
    final _$result = _$v ??
        new _$ScoreboardEntry._(
            previousScore: BuiltValueNullFieldError.checkNotNull(
                previousScore, 'ScoreboardEntry', 'previousScore'),
            bid: bid,
            tricks: tricks,
            burned: BuiltValueNullFieldError.checkNotNull(
                burned, 'ScoreboardEntry', 'burned'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
