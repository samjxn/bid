// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hand.sg.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Hand extends Hand {
  @override
  final BuiltList<Card> cards;

  factory _$Hand([void Function(HandBuilder)? updates]) =>
      (new HandBuilder()..update(updates)).build();

  _$Hand._({required this.cards}) : super._() {
    BuiltValueNullFieldError.checkNotNull(cards, 'Hand', 'cards');
  }

  @override
  Hand rebuild(void Function(HandBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HandBuilder toBuilder() => new HandBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Hand && cards == other.cards;
  }

  @override
  int get hashCode {
    return $jf($jc(0, cards.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Hand')..add('cards', cards))
        .toString();
  }
}

class HandBuilder implements Builder<Hand, HandBuilder> {
  _$Hand? _$v;

  ListBuilder<Card>? _cards;
  ListBuilder<Card> get cards => _$this._cards ??= new ListBuilder<Card>();
  set cards(ListBuilder<Card>? cards) => _$this._cards = cards;

  HandBuilder();

  HandBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cards = $v.cards.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Hand other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Hand;
  }

  @override
  void update(void Function(HandBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Hand build() {
    _$Hand _$result;
    try {
      _$result = _$v ?? new _$Hand._(cards: cards.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cards';
        cards.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Hand', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
