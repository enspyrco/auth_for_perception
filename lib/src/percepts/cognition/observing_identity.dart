import 'dart:async';

import 'package:error_correction_in_perception/error_correction_in_perception.dart';
import 'package:json_utils/json_utils.dart';
import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:firebase_auth_service_interface/firebase_auth_service_interface.dart';
import 'package:types_for_auth/types_for_auth.dart';
import 'package:abstractions/beliefs.dart';

import '../../../flutterfire_firebase_auth_for_perception.dart';
import 'update_user_auth_state.dart';

StreamSubscription<UserAuthState>? _subscription;

class ObservingIdentity<T extends CoreBeliefs> extends Consideration<T> {
  const ObservingIdentity();

  @override
  Future<void> consider(BeliefSystem<T> beliefSystem) async {
    FirebaseAuthService service = locate<FirebaseAuthService>();

    _subscription?.cancel();

    _subscription = service.onAuthStateChange.listen(
      (UserAuthState user) {
        beliefSystem.conclude(UpdateUserAuthState<T>(user));

        /// Start any cognitions that were added to [OnAuthStateChange].
        ///
        /// [AwayMission]s, which are async, are launched before [LandingMission]s
        /// so the [AwayMission]s aren't held up by the [LandingMission]s.
        final onAuthStateChange = locate<OnAuthStateChange<T>>();
        if (user.signedIn == SignedInState.signedIn) {
          for (final mission in onAuthStateChange.considerOnSignedIn) {
            beliefSystem.consider(mission);
          }
          for (final mission in onAuthStateChange.concludeOnSignedIn) {
            beliefSystem.conclude(mission);
          }
        } else if (user.signedIn == SignedInState.notSignedIn) {
          for (final mission in onAuthStateChange.considerOnSignedOut) {
            beliefSystem.consider(mission);
          }
          for (final mission in onAuthStateChange.concludeOnSignedOut) {
            beliefSystem.conclude(mission);
          }
        }
      },
      onError: (Object error, StackTrace trace) => beliefSystem.conclude(
        CreateFeedback(error, trace),
      ),
    );
  }

  @override
  JsonMap toJson() => {
        'name_': 'ObservingIdentity',
        'state_': <String, dynamic>{},
      };
}
