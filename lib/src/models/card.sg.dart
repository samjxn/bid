import 'package:built_value/built_value.dart';

part 'card.sg.g.dart';

enum Suit { heart, diamond, spade, club }

abstract class Card implements Built<Card, CardBuilder> {
  int get value;
  Suit get suit;

  @memoized
  String get label {
    final buffer = StringBuffer();
    switch (suit) {
      case Suit.heart:
        buffer.write('♥');
        break;
      case Suit.diamond:
        buffer.write('♦');
        break;
      case Suit.spade:
        buffer.write('♠');
        break;
      case Suit.club:
        buffer.write('♣');
        break;
    }
    if (value == 1) {
      buffer.write('A');
    } else if (value == 11) {
      buffer.write('J');
    } else if (value == 12) {
      buffer.write('Q');
    } else if (value == 13) {
      buffer.write('K');
    } else {
      buffer.write(value);
    }

    return buffer.toString();
  }

  Card._();

  factory Card(int value, Suit suit) => _$Card((CardBuilder b) => b
    ..value = value
    ..suit = suit);
}
