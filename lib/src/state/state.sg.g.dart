// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.sg.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BidState extends BidState {
  @override
  final Game? game;

  factory _$BidState([void Function(BidStateBuilder)? updates]) =>
      (new BidStateBuilder()..update(updates)).build();

  _$BidState._({this.game}) : super._();

  @override
  BidState rebuild(void Function(BidStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BidStateBuilder toBuilder() => new BidStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BidState && game == other.game;
  }

  @override
  int get hashCode {
    return $jf($jc(0, game.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BidState')..add('game', game))
        .toString();
  }
}

class BidStateBuilder implements Builder<BidState, BidStateBuilder> {
  _$BidState? _$v;

  GameBuilder? _game;
  GameBuilder get game => _$this._game ??= new GameBuilder();
  set game(GameBuilder? game) => _$this._game = game;

  BidStateBuilder();

  BidStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _game = $v.game?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BidState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BidState;
  }

  @override
  void update(void Function(BidStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BidState build() {
    _$BidState _$result;
    try {
      _$result = _$v ?? new _$BidState._(game: _game?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'game';
        _game?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BidState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
