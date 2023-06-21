import 'package:astro_core/astro_core.dart';
import 'package:astro_types/auth_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/material.dart';

import '../../../astro_auth.dart';
import 'composite_menu_button.dart';
import 'profile_avatar.dart';

class AvatarMenuButton<S extends AstroState> extends StatefulWidget {
  const AvatarMenuButton({required Set<MenuOption> options, Key? key})
      : _options = options,
        super(key: key);

  final Set<MenuOption> _options;

  @override
  State<AvatarMenuButton> createState() => _AvatarMenuButtonState<S>();
}

class _AvatarMenuButtonState<S extends AstroState>
    extends State<AvatarMenuButton> {
  final _popupKey = GlobalKey<PopupMenuButtonState<dynamic>>();

  @override
  Widget build(BuildContext context) {
    return OnStateChangeBuilder<S, String?>(
      transformer: (state) =>
          ((state as dynamic).auth as AuthState).user.photoURL,
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
