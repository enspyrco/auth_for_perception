import 'package:flutter/material.dart';
import 'package:types_for_perception/beliefs.dart';

import 'menu_option.dart';

class HiddenPopupMenuButton<S extends CoreBeliefs> extends StatelessWidget {
  const HiddenPopupMenuButton(this._key, Set<MenuOption> options, {Key? key})
      : _options = options,
        super(key: key);

  final Key _key;
  final Set<MenuOption> _options;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOption>(
      key: _key,
      enabled: false,
      onSelected: (option) => option.startMission<S>(context),
      itemBuilder: (context) => _options
          .map<PopupMenuEntry<MenuOption>>(
              (option) => PopupMenuItem<MenuOption>(
                    value: option,
                    child: Text(option.name),
                  ))
          .toList(),
      child: Container(color: Colors.red),
    );
  }
}
