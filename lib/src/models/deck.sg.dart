import 'package:bid/src/models/card.sg.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'card.sg.dart';
part 'deck.sg.g.dart';

abstract class Deck implements Built<Deck, DeckBuilder> {
  BuiltList<Card> get cards;

  Card? get first => cards.isNotEmpty ? cards.first : null;

  Deck._();

  DeckBuilder shuffled() {
    final builder = DeckBuilder();
    builder.cards = ListBuilder(cards)..shuffle();

    return builder;
  }

  DeckModification<Card> drawCard() {
    if (this.cards.isEmpty) {
      return DeckModification(
          null, DeckBuilder()..cards = ListBuilder(this.cards));
    }

    if (this.cards.length == 1) {
      return DeckModification(
        this.cards.first,
        DeckBuilder()..cards = ListBuilder([]),
      );
    }

    final card = this.cards.first;
    final cards = ListBuilder<Card>(this.cards.sublist(1));

    return DeckModification(card, DeckBuilder()..cards = cards);
  }

  static void Function(DeckBuilder) _initialState(bool shuffled) =>
      (DeckBuilder b) {
        final cardsBuilder = ListBuilder<Card>();
        for (final suit in Suit.values) {
          for (var i = 1; i <= 13; i++) {
            cardsBuilder.add(Card(i, suit));
          }
        }

        b.cards = cardsBuilder;
        if (shuffled) b.cards.shuffle();
      };

  factory Deck({bool shuffled = false}) => _$Deck(_initialState(shuffled));
}

class DeckModification<T> {
  T? value;
  DeckBuilder modifiedDeck;

  DeckModification(this.value, this.modifiedDeck);
}
