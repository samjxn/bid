import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import 'card.sg.dart';

part 'hand.sg.g.dart';

abstract class Hand implements Built<Hand, HandBuilder> {
  Hand._();

  BuiltList<Card> get cards;

  factory Hand() => _$Hand((HandBuilder b) => b..cards = ListBuilder<Card>());
}
