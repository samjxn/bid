// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.sg.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Game extends Game {
  @override
  final Scoreboard scoreboard;
  @override
  final BuiltList<Player> players;
  @override
  final int dealerIndex;
  @override
  final int? bidderIndex;
  @override
  final int round;

  factory _$Game([void Function(GameBuilder)? updates]) =>
      (new GameBuilder()..update(updates)).build();

  _$Game._(
      {required this.scoreboard,
      required this.players,
      required this.dealerIndex,
      this.bidderIndex,
      required this.round})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(scoreboard, 'Game', 'scoreboard');
    BuiltValueNullFieldError.checkNotNull(players, 'Game', 'players');
    BuiltValueNullFieldError.checkNotNull(dealerIndex, 'Game', 'dealerIndex');
    BuiltValueNullFieldError.checkNotNull(round, 'Game', 'round');
  }

  @override
  Game rebuild(void Function(GameBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GameBuilder toBuilder() => new GameBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Game &&
        scoreboard == other.scoreboard &&
        players == other.players &&
        dealerIndex == other.dealerIndex &&
        bidderIndex == other.bidderIndex &&
        round == other.round;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, scoreboard.hashCode), players.hashCode),
                dealerIndex.hashCode),
            bidderIndex.hashCode),
        round.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Game')
          ..add('scoreboard', scoreboard)
          ..add('players', players)
          ..add('dealerIndex', dealerIndex)
          ..add('bidderIndex', bidderIndex)
          ..add('round', round))
        .toString();
  }
}

class GameBuilder implements Builder<Game, GameBuilder> {
  _$Game? _$v;

  ScoreboardBuilder? _scoreboard;
  ScoreboardBuilder get scoreboard =>
      _$this._scoreboard ??= new ScoreboardBuilder();
  set scoreboard(ScoreboardBuilder? scoreboard) =>
      _$this._scoreboard = scoreboard;

  ListBuilder<Player>? _players;
  ListBuilder<Player> get players =>
      _$this._players ??= new ListBuilder<Player>();
  set players(ListBuilder<Player>? players) => _$this._players = players;

  int? _dealerIndex;
  int? get dealerIndex => _$this._dealerIndex;
  set dealerIndex(int? dealerIndex) => _$this._dealerIndex = dealerIndex;

  int? _bidderIndex;
  int? get bidderIndex => _$this._bidderIndex;
  set bidderIndex(int? bidderIndex) => _$this._bidderIndex = bidderIndex;

  int? _round;
  int? get round => _$this._round;
  set round(int? round) => _$this._round = round;

  GameBuilder();

  GameBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _scoreboard = $v.scoreboard.toBuilder();
      _players = $v.players.toBuilder();
      _dealerIndex = $v.dealerIndex;
      _bidderIndex = $v.bidderIndex;
      _round = $v.round;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Game other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Game;
  }

  @override
  void update(void Function(GameBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Game build() {
    _$Game _$result;
    try {
      _$result = _$v ??
          new _$Game._(
              scoreboard: scoreboard.build(),
              players: players.build(),
              dealerIndex: BuiltValueNullFieldError.checkNotNull(
                  dealerIndex, 'Game', 'dealerIndex'),
              bidderIndex: bidderIndex,
              round: BuiltValueNullFieldError.checkNotNull(
                  round, 'Game', 'round'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'scoreboard';
        scoreboard.build();
        _$failedField = 'players';
        players.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Game', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
