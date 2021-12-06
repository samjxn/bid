import 'package:bid/src/actions/game_actions.dart';
import 'package:bid/src/actions/scoreboard_actions.dart';
import 'package:bid/src/models/game.sg.dart';
import 'package:bid/src/models/player.sg.dart';
import 'package:bid/src/state/state.sg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class GameInput extends StatelessWidget {
  final Game game;
  const GameInput(this.game, {Key? key}) : super(key: key);

  Widget _buildInput() {
    if (game.isBidding) {
      return _renderBiddingInput();
    }

    return Column(children: [
      _renderTrickInput(),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_renderNextRoundButton()],
      ),
    ]);
  }

  Widget _renderBidButtons() {
    final maxBid = game.hand;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 1; i <= maxBid; i++) _renderBidButton(i),
      ],
    );
  }

  Widget _renderBidButton(int bid) {
    final bidder = game.players[game.bidderIndex!];

    final isDealer = game.bidderIndex == game.dealerIndex;

    int? disallowedBid;
    if (isDealer) {
      final runningBidCount = game.scoreboard.scoreboard.values
          .map((e) => e.last.bid ?? 0)
          .fold<int>(0, (p, e) => p + e);

      if (runningBidCount <= game.hand) {
        disallowedBid = game.hand - runningBidCount;
      }
    }

    var isDisabled = disallowedBid != null && bid == disallowedBid;

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: StoreConnector<BidState, void Function()>(
        converter: (store) => () {
          store.dispatch(SetBid(bidder, bid));
          store.dispatch(UpdateBidder());
        },
        builder: (context, callback) => ElevatedButton(
          onPressed: isDisabled ? null : callback,
          child: Text(
            '$bid',
            style: const TextStyle(fontSize: 42.0),
          ),
        ),
      ),
    );
  }

  Widget _renderBiddingInput() {
    assert(game.bidderIndex != null);
    final playerName = game.players[game.bidderIndex!].name;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Bid for: $playerName'),
        _renderBidButton(0),
        _renderBidButtons(),
      ],
    );
  }

  Widget _renderTrickInput() {
    return Column(
      children: [
        for (final player in game.players)
          StoreConnector<BidState, void Function(int)>(
            converter: (store) => (int tricks) {
              store.dispatch(SetPlayersTrickCounts({player: tricks}));
            },
            builder: (context, callback) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 100, child: Center(child: Text(player.name))),
                for (var i = 0; i <= game.hand; i++)
                  _renderTrickButton(player, i),
                Container(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                        'Tricks: ${game.scoreboard.scoreboard[player.id]!.last.tricks}')),
              ],
            ),
          ),
      ],
    );
  }

  Widget _renderTrickButton(Player player, int tricks) {
    final playerTricks = game.scoreboard.scoreboard[player.id]!.last.tricks!;
    final playerBid = game.scoreboard.scoreboard[player.id]!.last.bid!;
    final isDisabled = tricks == playerTricks;
    return StoreConnector<BidState, void Function()>(
      converter: (store) => () {
        store.dispatch(SetPlayersTrickCounts({player: tricks}));
      },
      builder: (context, callback) => Container(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: isDisabled ? null : callback,
          child: Text('$tricks'),
          style: tricks == playerBid
              ? ElevatedButton.styleFrom(primary: Colors.green)
              : ElevatedButton.styleFrom(primary: Colors.red),
        ),
      ),
    );
  }

  Widget _renderNextRoundButton() {
    final totalTricks = game.scoreboard.scoreboard.values
        .fold<int>(0, (p, e) => e.last.tricks! + p);
    final isDisabled = game.scoreboard.scoreboard.values
            .any((scores) => scores.last.tricks == null) ||
        game.hand != totalTricks;
    final noOneIsSet =
        !game.scoreboard.scoreboard.values.any((i) => i.last.broke);
    final tooFewTricks = totalTricks < game.hand;
    final tooManyTricks = totalTricks > game.hand;

    return StoreConnector<BidState, void Function()>(
        builder: (context, callback) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: ElevatedButton(
                  onPressed: isDisabled ? null : callback,
                  child: const Text('Next Round'),
                ),
              ),
              if (noOneIsSet)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: const Text(
                    '"Someone is going set." – Douglas Knepp',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              if (tooFewTricks)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                      '${game.hand - totalTricks} more trick${game.hand - totalTricks == 1 ? '' : 's'} need${game.hand - totalTricks == 1 ? 's' : ''} to be claimed.'),
                ),
              if (tooManyTricks)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                      '${totalTricks - game.hand} too many tricks have been claimed.'),
                ),
            ],
          )
        ],
      );
    }, converter: (store) {
      return () {
        store.dispatch(NextHand());
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildInput();
  }
}
