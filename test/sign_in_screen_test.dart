import 'package:auth_for_perception/auth_for_perception.dart';
import 'package:test_utils_for_perception/test_utils_for_perception.dart';
import 'package:firebase_auth_service_flutterfire/auth_state_flutterfire.dart';
import 'package:firebase_auth_service_flutterfire/user_auth_state_flutterfire.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:types_for_auth/types_for_auth.dart';

import 'test-doubles/auth_for_perception_app_state.dart';

void main() {
  group('SignInScreen', () {
    testWidgets('lays out platform appropriate sign in buttons',
        (tester) async {
      // Setup an app state where checking is done and there was no signed in user found.
      final state = AstroAuthAppState.initial.copyWith(
          auth: AuthStateFlutterfire().copyWith(
              user: UserAuthStateFlutterfire(
                  signedIn: SignedInState.notSignedIn)));

      // Setup a harness with the initial state.
      final harness = WidgetTestHarness<AstroAuthAppState>(
        initialState: state,
        innerWidget: const SignInScreen<AstroAuthAppState>(),
      );

      await tester.pumpWidget(harness.widget);

      expect(find.byType(SignInWithAppleButton), findsOneWidget);
    });
  });
}
