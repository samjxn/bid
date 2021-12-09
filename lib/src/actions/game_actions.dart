import 'package:bid/src/models/player.sg.dart';

class UpdateBidder {}

class UpdateDealer {}

class NextHand {}

class NewGame {
  Iterable<Player>? players;
  int? dealerIndex;

  NewGame([this.players, this.dealerIndex]);
}
