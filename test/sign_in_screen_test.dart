import 'package:flutterfire_firebase_auth_for_perception/flutterfire_firebase_auth_for_perception.dart';
import 'package:percepts/percepts.dart';

import 'package:test_utils_for_perception/test_utils_for_perception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:types_for_auth/types_for_auth.dart';

import 'test-doubles/astro_auth_app_state.dart';

void main() {
  group('SignInScreen', () {
    testWidgets('lays out platform appropriate sign in buttons',
        (tester) async {
      // Setup an app state where checking is done and there was no signed in user found.
      final state = AstroAuthAppState.initial.copyWith(
        identity: DefaultIdentityBeliefs.initial.copyWith(
          userAuthState:
              const DefaultUserAuthState(signedIn: SignedInState.notSignedIn),
        ),
      );

      // Setup a harness with the initial state.
      final harness = WidgetTestHarness<AstroAuthAppState>(
        initialBeliefs: state,
        innerWidget: const SignInScreen<AstroAuthAppState>(),
      );

      await tester.pumpWidget(harness.widget);

      expect(find.byType(SignInWithAppleButton), findsOneWidget);
    });
  });
}
