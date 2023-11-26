import 'package:abstractions/beliefs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:percepts/percepts.dart';
import 'package:types_for_auth/types_for_auth.dart';

import '../cognition/signing_in_with_apple.dart';

class SignInScreen<T extends CoreBeliefs> extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamOfConsciousness<T, SignedInState>(
        infer: (state) =>
            (state as dynamic).identity.userAuthState.signedIn as SignedInState,
        builder: (context, signedInState) {
          if (signedInState == SignedInState.notSignedIn) {
            return MaterialButton(
              onPressed: () {
                locate<BeliefSystem<T>>()
                    .consider(SigningInWithApple<T>(isWeb: kIsWeb));
              },
              child: const Text('Hello'),
            );
          }
          return const CircularProgressIndicator();
        });
  }
}
