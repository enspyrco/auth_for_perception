import 'package:astro_core/astro_core.dart';
import 'package:astro_types/auth_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:flutter/material.dart';

import '../sign-in/sign_in_screen.dart';

class AuthGateScreen<S extends AstroState> extends StatelessWidget {
  const AuthGateScreen({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OnStateChangeBuilder<S, SignedInState>(
      transformer: (state) =>
          (state as dynamic).auth.user.signedIn as SignedInState,
      builder: ((context, signedInState) {
        switch (signedInState) {
          case SignedInState.checking:
            return const ProgressIndicatorWithMessage('Checking...');
          case SignedInState.notSignedIn:
            return SignInScreen<S>();
          case SignedInState.signedIn:
            return child;
          default:
            return const CircularProgressIndicator();
        }
      }),
    );
  }
}
