import 'package:abstractions/identity.dart';
import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:firebase_auth_service_interface/firebase_auth_service_interface.dart';
import 'package:json_utils/json_utils.dart';
import 'package:abstractions/beliefs.dart';

class SigningInToFirebase<T extends CoreBeliefs> extends Consideration<T> {
  const SigningInToFirebase({
    required this.credential,
  });

  final ProviderCredential credential;

  @override
  Future<void> consider(BeliefSystem<T> beliefSystem) async {
    final service = locate<FirebaseAuthService>();

    if (credential is AppleCredential) {
      /// We just sign in here, adding the user data to the app state happens where
      /// the "auth state changed" event is handled - in [BindAuthState.flightPlan]
      final appleCredential = credential as AppleCredential;
      await service.signInWithApple(
          idToken: appleCredential.idToken, rawNonce: appleCredential.rawNonce);
    }
  }

  @override
  JsonMap toJson() => {
        'name_': 'Sign In With Firebase',
        'state_': switch (credential) {
          AppleCredential() => <String, Object?>{
              'idToken': (credential as AppleCredential).idToken,
              'rawNonce': (credential as AppleCredential).rawNonce,
            }
        },
      };
}
