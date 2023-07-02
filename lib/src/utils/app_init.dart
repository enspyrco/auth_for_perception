import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:navigation_for_perception/navigation_for_perception.dart';
import 'package:types_for_perception/core_types.dart';
import 'package:types_for_perception/state_types.dart';
import 'package:firebase_auth_service_flutterfire/firebase_auth_service_flutterfire.dart';
import 'package:firebase_auth_service_interface/firebase_auth_service_interface.dart';
import 'package:flutter/material.dart';

import '../../auth_for_perception.dart';

void initializeAuthPlugin<S extends AstroState>({
  required Widget initialScreen,
  List<AwayMission<S>>? launchOnSignedIn,
  List<LandingMission<S>>? landOnSignedIn,
  List<AwayMission<S>>? launchOnSignedOut,
  List<LandingMission<S>>? landOnSignedOut,
}) {
  /// Add the [OnAuthStateChange] object to the locator, which will be used
  /// to kick off missions at given auth state change events.
  Locator.add<OnAuthStateChange<S>>(
    OnAuthStateChange<S>(
      launchOnSignedIn: launchOnSignedIn,
      landOnSignedIn: landOnSignedIn,
      launchOnSignedOut: launchOnSignedOut,
      landOnSignedOut: landOnSignedOut,
    ),
  );

  /// Start with the AuthGate as the only route in the navigation stack
  Locator.add<S>((locate<S>() as dynamic).copyWith(
      navigation:
          const DefaultNavigationState(stack: [AuthGatePageState()])) as S);

  locate<PageGenerator>().add(
      type: AuthGatePageState,
      generator: (state) =>
          MaterialPage(child: AuthGateScreen<S>(child: initialScreen)));

  /// Create and add a FirebaseAuthService to the Locator
  Locator.add<FirebaseAuthService>(FirebaseAuthServiceFlutterfire());
}
