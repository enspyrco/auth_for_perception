library flutterfire_firebase_auth_for_perception;

import 'package:abstractions/beliefs.dart';
import 'package:flutter/material.dart';
import 'package:framing_in_perception/framing_in_perception.dart';
import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:percepts/percepts.dart';

import 'src/subsystems/flutterfire_firebase_auth_subsystem.dart';
import 'src/widgets/sign_in_screen_with_platform_default_button.dart';

export 'src/widgets/avatar_menu_button/avatar_menu_button.dart';
export 'src/widgets/avatar_menu_button/menu_option.dart';
export 'src/widgets/sign_out_button.dart';
export 'src/cognition/signing_out.dart';
export 'src/widgets/sign_in_screen_with_platform_default_button.dart';
export 'src/subsystems/flutterfire_firebase_auth_subsystem.dart';

///
void initializeIdentity<S extends CoreBeliefs>({
  required Widget initialScreen,
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

  /// Start with the AuthGate as the only framing layer
  Locator.add<S>((locate<S>() as dynamic).copyWith(
      framing: const DefaultFramingBeliefs(layers: [AuthGateLayer()])) as S);

  locate<PageGenerator>().add(
    type: AuthGateLayer,
    generator: (state) => MaterialPage(
      child: AuthGateScreen<S>(
          signInScreen: SignInScreenWithPlatformDefaultButton<S>(),
          homeScreen: initialScreen),
    ),
  );

  /// Create and add a FlutterfireFirebaseAuthSubsystem to the Locator
  Locator.add<FlutterfireFirebaseAuthSubsystem>(
    FlutterfireFirebaseAuthSubsystem(),
  );
}
