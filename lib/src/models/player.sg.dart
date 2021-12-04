import 'package:built_value/built_value.dart';

part 'player.sg.g.dart';

abstract class Player implements Built<Player, PlayerBuilder> {
  String get name;
  String get id;

  static int _count = 0;

  Player._();
  factory Player(
    String name, {
    String? id,
  }) =>
      _$Player((PlayerBuilder b) => b
        ..name = name
        ..id = id ?? 'Player${_count++}');
}
