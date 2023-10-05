import 'package:percepts/percepts.dart';
import 'package:flutter/material.dart';
import 'package:types_for_auth/types_for_auth.dart';
import 'package:abstractions/beliefs.dart';

import '../sign-in/sign_in_screen.dart';

class AuthGateScreen<S extends CoreBeliefs> extends StatelessWidget {
  const AuthGateScreen({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StreamOfConsciousness<S, SignedInState>(
      infer: (state) =>
          (state as dynamic).identity.userAuthState.signedIn as SignedInState,
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
