import 'package:flutter/material.dart';
import 'package:abstractions/beliefs.dart';

import 'hidden_popup_menu_button.dart';
import 'menu_option.dart';

/// The button actually consists of two buttons in a stack.  A [HiddenPopupMenuButton]
/// and the injected [topButton], eg. [AvatarMenuButton] passed in our
/// custom-made [ProfileAvatar].
///
/// The [PopupMenuButton] is disabled but the [topButton] is setup to open
/// the [PopupMenuButton]'s menu.
///
/// A global key is given to [HiddenPopupMenuButton] to be used as the
/// [PopupMenuButton]'s key. The key is also used by the [topButton] to pop the
/// menu.
class CompositeMenuButton<S extends CoreBeliefs> extends StatelessWidget {
  const CompositeMenuButton(
      {required Widget topButton,
      required Set<MenuOption> options,
      required GlobalKey<PopupMenuButtonState<dynamic>> popupKey,
      Key? key})
      : _topButton = topButton,
        _options = options,
        _popupKey = popupKey,
        super(key: key);

  final Set<MenuOption> _options;
  final Widget _topButton;
  final GlobalKey<PopupMenuButtonState<dynamic>> _popupKey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HiddenPopupMenuButton<S>(_popupKey, _options),
        Padding(padding: const EdgeInsets.all(8.0), child: _topButton),
      ],
    );
  }
}
