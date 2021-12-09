import 'package:bid/src/models/game.sg.dart';
import 'package:bid/src/models/player.sg.dart';
import 'package:built_value/built_value.dart';

part 'state.sg.g.dart';

abstract class BidState implements Built<BidState, BidStateBuilder> {
  Game? get game;

  BidState._();

  factory BidState() => _$BidState((BidStateBuilder b) => b);
}
