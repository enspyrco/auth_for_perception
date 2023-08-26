import 'package:core_of_perception/core_of_perception.dart';
import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart' as plugin;
import 'package:types_for_auth/types_for_auth.dart';
import 'package:types_for_perception/beliefs.dart';

import '../../missions/sign_in_with_apple.dart';

class SignInScreen<T extends CoreBeliefs> extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnStateChangeBuilder<T, SignedInState>(
        transformer: (state) =>
            (state as dynamic).auth.user.signedIn as SignedInState,
        builder: (context, signedInState) {
          if (signedInState == SignedInState.notSignedIn) {
            return plugin.SignInWithAppleButton(
                onPressed: () =>
                    locate<MissionControl<T>>().launch(SignInWithApple<T>()));
          }
          return const CircularProgressIndicator();
        });
  }
}
