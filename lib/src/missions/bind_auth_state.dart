import 'dart:async';

import 'package:error_handling_for_perception/error_handling_for_perception.dart';
import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:types_for_perception/auth_types.dart';
import 'package:types_for_perception/core_types.dart';
import 'package:types_for_perception/json_types.dart';
import 'package:types_for_perception/state_types.dart';
import 'package:firebase_auth_service_interface/firebase_auth_service_interface.dart';

import '../utils/on_auth_state_change.dart';
import 'update_user_auth_state.dart';

StreamSubscription<UserAuthState>? _subscription;

class BindAuthState<T extends AstroState> extends AwayMission<T> {
  const BindAuthState();

  @override
  Future<void> flightPlan(MissionControl<T> missionControl) async {
    var service = locate<FirebaseAuthService>();

    _subscription?.cancel();

    _subscription = service.onAuthStateChange.listen(
      (user) {
        missionControl.land(UpdateUserAuthState<T>(user));

        /// Start any missions that were added to [OnAuthStateChangeMissions].
        ///
        /// [AwayMission]s, which are async, are launched before [LandingMission]s
        /// so the [AwayMission]s aren't held up by the [LandingMission]s.
        final authStateChangeMissions = locate<OnAuthStateChange<T>>();
        if (user.signedIn == SignedInState.signedIn) {
          for (var mission in authStateChangeMissions.launchOnSignedIn) {
            missionControl.launch(mission);
          }
          for (var mission in authStateChangeMissions.landOnSignedIn) {
            missionControl.land(mission);
          }
        } else if (user.signedIn == SignedInState.notSignedIn) {
          for (var mission in authStateChangeMissions.launchOnSignedOut) {
            missionControl.launch(mission);
          }
          for (var mission in authStateChangeMissions.landOnSignedOut) {
            missionControl.land(mission);
          }
        }
      },
      onError: (Object error, StackTrace trace) => missionControl.land(
        CreateErrorReport(error, trace),
      ),
    );
  }

  @override
  JsonMap toJson() => {
        'name_': 'Bind Auth State',
        'state_': <String, dynamic>{},
      };
}
