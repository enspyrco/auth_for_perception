import 'dart:io';

import 'package:abstractions/beliefs.dart';
import 'package:abstractions/identity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:percepts/percepts.dart';
import 'package:types_for_auth/types_for_auth.dart';
import 'package:auth_buttons/auth_buttons.dart'
    show AppleAuthButton, GoogleAuthButton;

import '../cognition/signing_in_with_provider.dart';

///
class SignInScreenWithPlatformDefaultButton<T extends CoreBeliefs>
    extends StatelessWidget {
  const SignInScreenWithPlatformDefaultButton({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamOfConsciousness<T, SignedInState>(
        infer: (state) =>
            (state as dynamic).identity.userAuthState.signedIn as SignedInState,
        builder: (context, signedInState) {
          if (signedInState == SignedInState.notSignedIn) {
            if (Platform.isIOS || Platform.isMacOS) {
              return AppleAuthButton(onPressed: () {
                locate<BeliefSystem<T>>().consider(
                  SigningInWithProvider<T>(
                      provider: IdentityProvider.apple, isWeb: kIsWeb),
                );
              });
            } else if (Platform.isAndroid || kIsWeb) {
              return GoogleAuthButton(onPressed: () {
                locate<BeliefSystem<T>>().consider(
                  SigningInWithProvider<T>(
                      provider: IdentityProvider.google, isWeb: kIsWeb),
                );
              });
            } else {
              return const Text(
                  'Platform not yet supported, feel free to create an issue.');
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
