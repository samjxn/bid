import 'package:bid/src/models/player.sg.dart';

class SetBid {
  final Player bidder;
  final int bid;

  SetBid(this.bidder, this.bid);
}

class SetPlayersTrickCounts {
  final Map<Player, int> playersToTricks;

  SetPlayersTrickCounts(this.playersToTricks);
}

class PrepareNextRow {}
