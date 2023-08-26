import 'package:core_of_perception/core_of_perception.dart';
import 'package:flutter/material.dart';
import 'package:types_for_auth/types_for_auth.dart';
import 'package:types_for_perception/beliefs.dart';

import '../sign-in/sign_in_screen.dart';

class AuthGateScreen<S extends CoreBeliefs> extends StatelessWidget {
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
