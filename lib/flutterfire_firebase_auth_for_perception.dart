library flutterfire_firebase_auth_for_perception;

import 'package:abstractions/beliefs.dart';
import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:percepts/percepts.dart';

import 'src/subsystems/flutterfire_firebase_auth_subsystem.dart';

export 'src/percepts/cognition/signing_out_of_firebase.dart';
export 'src/widgets/avatar_menu_button/avatar_menu_button.dart';
export 'src/widgets/avatar_menu_button/menu_option.dart';
export 'src/subsystems/flutterfire_firebase_auth_subsystem.dart';

void initializeFlutterfireFirebaseAuth<S extends CoreBeliefs>({
  List<Consideration<S>>? considerOnSignedIn,
  List<Conclusion<S>>? concludeOnSignedIn,
  List<Consideration<S>>? considerOnSignedOut,
  List<Conclusion<S>>? concludeOnSignedOut,
}) {
  /// Add the [OnAuthStateChange] object to the locator, which will be used
  /// to kick off missions at given auth state change events.
  Locator.add<OnProviderAuthStateChange<S>>(
    OnProviderAuthStateChange<S>(
      considerOnSignedIn: considerOnSignedIn,
      concludeOnSignedIn: concludeOnSignedIn,
      considerOnSignedOut: considerOnSignedOut,
      concludeOnSignedOut: concludeOnSignedOut,
    ),
  );

  /// Create and add a FlutterfireFirebaseAuthSubsystem to the Locator
  Locator.add<FlutterfireFirebaseAuthSubsystem>(
    FlutterfireFirebaseAuthSubsystem(),
  );
}
