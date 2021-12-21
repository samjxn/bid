import 'package:bid/src/models/player.sg.dart';

class UpdateBidder {}

class PreviousBidder {}

class UpdateDealer {}

class StartTricking {}

class NextHand {}

class NewGame {
  Iterable<Player>? players;
  int? dealerIndex;

  NewGame([this.players, this.dealerIndex]);
}

class SetRecentBid {
  int? bid;

  SetRecentBid([this.bid]);
}

class SetActionCompleter {
  Future? actionFuture;

  SetActionCompleter([this.actionFuture]);
}
