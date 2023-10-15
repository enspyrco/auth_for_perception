import 'package:percepts/percepts.dart';
import 'package:flutter/material.dart';
import 'package:abstractions/identity.dart';
import 'package:abstractions/beliefs.dart';

import '../../../flutterfire_firebase_auth_for_perception.dart';
import 'composite_menu_button.dart';
import 'profile_avatar.dart';

class AvatarMenuButton<S extends CoreBeliefs> extends StatefulWidget {
  const AvatarMenuButton({required Set<MenuOption> options, Key? key})
      : _options = options,
        super(key: key);

  final Set<MenuOption> _options;

  @override
  State<AvatarMenuButton> createState() => _AvatarMenuButtonState<S>();
}

class _AvatarMenuButtonState<S extends CoreBeliefs>
    extends State<AvatarMenuButton> {
  final _popupKey = GlobalKey<PopupMenuButtonState<dynamic>>();

  @override
  Widget build(BuildContext context) {
    return StreamOfConsciousness<S, String?>(
      infer: (state) => ((state as dynamic).identity as IdentityBeliefs)
          .userAuthState
          .photoURL,
      builder: (context, photoURL) {
        return CompositeMenuButton<S>(
            options: widget._options,
            topButton: ProfileAvatar(photoURL,
                onPressed: () => _popupKey.currentState?.showButtonMenu()),
            popupKey: _popupKey);
      },
    );
  }
}
