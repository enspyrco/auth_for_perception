import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:framing_in_perception/framing_in_perception.dart';
import 'package:firebase_auth_service_interface/firebase_auth_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:abstractions/beliefs.dart';

import '../../flutterfire_firebase_auth_for_perception.dart';
import '../services/flutterfire_firebase_auth_service.dart';

void initializeFlutterfireFirebaseAuth<S extends CoreBeliefs>({
  required Widget initialScreen,
  List<Consideration<S>>? launchOnSignedIn,
  List<Conclusion<S>>? landOnSignedIn,
  List<Consideration<S>>? launchOnSignedOut,
  List<Conclusion<S>>? landOnSignedOut,
}) {
  /// Add the [OnAuthStateChange] object to the locator, which will be used
  /// to kick off missions at given auth state change events.
  Locator.add<OnAuthStateChange<S>>(
    OnAuthStateChange<S>(
      considerOnSignedIn: launchOnSignedIn,
      concludeOnSignedIn: landOnSignedIn,
      considerOnSignedOut: launchOnSignedOut,
      concludeOnSignedOut: landOnSignedOut,
    ),
  );

  /// Start with the AuthGate as the only route in the navigation stack
  Locator.add<S>((locate<S>() as dynamic).copyWith(
          framing: const DefaultFramingBeliefs(layers: [AuthGatePageState()]))
      as S);

  locate<PageGenerator>().add(
      type: AuthGatePageState,
      generator: (state) =>
          MaterialPage(child: AuthGateScreen<S>(child: initialScreen)));

  /// Create and add a FirebaseAuthService to the Locator
  Locator.add<FirebaseAuthService>(FlutterfireFirebaseAuthService());
}
