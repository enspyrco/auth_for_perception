import 'package:abstractions/beliefs.dart';
import 'package:flutter/material.dart';
import 'package:locator_for_perception/locator_for_perception.dart';

import '../cognition/signing_out.dart';

class SignOutOfFirebaseButton<T extends CoreBeliefs> extends StatelessWidget {
  const SignOutOfFirebaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        locate<BeliefSystem<T>>().consider(SigningOut<T>());
      },
      textColor: Colors.amber,
      child: const Text('Sign Out'),
    );
  }
}
