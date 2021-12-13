import 'dart:math';

import 'package:bid/src/actions/game_actions.dart';
import 'package:bid/src/models/player.sg.dart';
import 'package:bid/src/state/state.sg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CreateGameWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateGameWidgetState();

  const CreateGameWidget({Key? key}) : super(key: key);
}

class CreateGameWidgetState extends State<CreateGameWidget> {
  static const int _defaultNumPlayers = 4;

  final _random = Random();

  int _dealerIndex = 0;

  final Map<int, TextEditingController> _playerIndexToName = {
    for (var i = 0; i < _defaultNumPlayers; i++) i: TextEditingController(),
  };

  int get _numPlayers => _playerIndexToName.length;

  Iterable<Widget> _renderNameInputs() sync* {
    for (final entry in _playerIndexToName.entries) {
      yield _toNameInput(entry.key, entry.value);
    }
  }

  Widget _toNameInput(int index, TextEditingController controller) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: SizedBox(
          width: 400,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              icon: const Icon(Icons.person),
              border: const OutlineInputBorder(),
              hintText: 'Player ${index + 1}',
            ),
          ),
        ),
      ),
      Column(
        children: [
          _renderMakeDealerButton(index),
          if (index == _numPlayers - 1 && _numPlayers > 4)
            _renderDeleteButton(index),
        ],
      )
    ]);
  }

  Widget _renderDeleteButton(int playerIndex) {
    return Container(
      padding: const EdgeInsets.only(left: 4.0),
      child: ElevatedButton.icon(
        onPressed: () {
          setState(() {
            _playerIndexToName.remove(playerIndex);
            if (_dealerIndex == playerIndex) {
              _dealerIndex = _numPlayers - 1;
            }
          });
        },
        icon: const Icon(Icons.remove),
        label: const Text('Remove Player'),
      ),
    );
  }

  Widget _renderMakeDealerButton(int playerIndex) {
    final isDealer = playerIndex == _dealerIndex;

    void _onPressed() {
      setState(() {
        _dealerIndex = playerIndex;
      });
    }

    return ElevatedButton.icon(
      onPressed: isDealer ? null : _onPressed,
      icon: const Icon(Icons.star),
      label: const Text('Make Dealer'),
    );
  }

  Widget _renderButtons() {
    final has7 = _playerIndexToName.length == 7;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: has7
              ? null
              : () {
                  setState(() {
                    _playerIndexToName[_numPlayers] = TextEditingController();
                  });
                },
          label: const Text('Add Player'),
          icon: const Icon(Icons.person_add),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
          child: ElevatedButton.icon(
            onPressed: () {
              setState(() {
                _dealerIndex = _random.nextInt(_numPlayers);
              });
            },
            label: const Text('Random Dealer'),
            icon: const Icon(Icons.shuffle),
          ),
        ),
        StoreConnector<BidState, void Function()>(
          converter: (store) => () {
            store.dispatch(
              NewGame(
                _playerIndexToName.entries.map(
                  (e) => Player(e.value.text.isNotEmpty
                      ? e.value.text
                      : 'Player ${e.key + 1}'),
                ),
                _dealerIndex,
              ),
            );
          },
          builder: (context, callback) => ElevatedButton.icon(
            onPressed: callback,
            style: ElevatedButton.styleFrom(primary: Colors.green),
            label: const Text('Start Game'),
            icon: const Icon(Icons.check),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: [
          ..._renderNameInputs(),
          _renderButtons(),
        ],
      ),
    );
  }
}
