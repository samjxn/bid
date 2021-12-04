// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.sg.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Card extends Card {
  @override
  final int value;
  @override
  final Suit suit;
  String? __label;

  factory _$Card([void Function(CardBuilder)? updates]) =>
      (new CardBuilder()..update(updates)).build();

  _$Card._({required this.value, required this.suit}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, 'Card', 'value');
    BuiltValueNullFieldError.checkNotNull(suit, 'Card', 'suit');
  }

  @override
  String get label => __label ??= super.label;

  @override
  Card rebuild(void Function(CardBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CardBuilder toBuilder() => new CardBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Card && value == other.value && suit == other.suit;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, value.hashCode), suit.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Card')
          ..add('value', value)
          ..add('suit', suit))
        .toString();
  }
}

class CardBuilder implements Builder<Card, CardBuilder> {
  _$Card? _$v;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  Suit? _suit;
  Suit? get suit => _$this._suit;
  set suit(Suit? suit) => _$this._suit = suit;

  CardBuilder();

  CardBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _suit = $v.suit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Card other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Card;
  }

  @override
  void update(void Function(CardBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Card build() {
    final _$result = _$v ??
        new _$Card._(
            value:
                BuiltValueNullFieldError.checkNotNull(value, 'Card', 'value'),
            suit: BuiltValueNullFieldError.checkNotNull(suit, 'Card', 'suit'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
