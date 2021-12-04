// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck.sg.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Deck extends Deck {
  @override
  final BuiltList<Card> cards;

  factory _$Deck([void Function(DeckBuilder)? updates]) =>
      (new DeckBuilder()..update(updates)).build();

  _$Deck._({required this.cards}) : super._() {
    BuiltValueNullFieldError.checkNotNull(cards, 'Deck', 'cards');
  }

  @override
  Deck rebuild(void Function(DeckBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeckBuilder toBuilder() => new DeckBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Deck && cards == other.cards;
  }

  @override
  int get hashCode {
    return $jf($jc(0, cards.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Deck')..add('cards', cards))
        .toString();
  }
}

class DeckBuilder implements Builder<Deck, DeckBuilder> {
  _$Deck? _$v;

  ListBuilder<Card>? _cards;
  ListBuilder<Card> get cards => _$this._cards ??= new ListBuilder<Card>();
  set cards(ListBuilder<Card>? cards) => _$this._cards = cards;

  DeckBuilder();

  DeckBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _cards = $v.cards.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Deck other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Deck;
  }

  @override
  void update(void Function(DeckBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Deck build() {
    _$Deck _$result;
    try {
      _$result = _$v ?? new _$Deck._(cards: cards.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'cards';
        cards.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Deck', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
