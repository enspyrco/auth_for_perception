import 'package:abstractions/identity.dart';
import 'package:json_utils/json_utils.dart';
import 'package:abstractions/beliefs.dart';
import 'package:locator_for_perception/locator_for_perception.dart';

import '../subsystems/flutterfire_firebase_auth_subsystem.dart';

class SigningInWithProvider<T extends CoreBeliefs> extends Consideration<T> {
  const SigningInWithProvider({required this.provider, this.isWeb = false});

  final bool isWeb;
  final IdentityProvider provider;

  @override
  Future<void> consider(BeliefSystem<T> beliefSystem) async {
    final service = locate<FlutterfireFirebaseAuthSubsystem>();

    switch (provider) {
      case IdentityProvider.apple:
        await service.signInToAppleThenFirebase();
      case IdentityProvider.google:
      // await service.signInToGoogleThenFirebase();
      default:
        throw 'Identity Provider $provider is not yet supported.';
    }
  }

  @override
  JsonMap toJson() => {
        'name_': 'SigningInWithApple',
        'state_': <String, Object?>{'isWeb': isWeb},
      };
}
