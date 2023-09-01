import 'package:flutterfire_firebase_auth_service/flutterfire_identity_beliefs.dart';
import 'package:flutterfire_firebase_auth_service/flutterfire_user_auth_belief.dart';
import 'package:identity_in_perception/identity_in_perception.dart';
import 'package:test_utils_for_perception/test_utils_for_perception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:types_for_auth/types_for_auth.dart';

import 'test-doubles/identity_in_perception_app_state.dart';

void main() {
  group('SignInScreen', () {
    testWidgets('lays out platform appropriate sign in buttons',
        (tester) async {
      // Setup an app state where checking is done and there was no signed in user found.
      final state = AstroAuthAppState.initial.copyWith(
          auth: const FlutterfireIdentityBeliefs().copyWith(
              user: const FlutterfireUserAuthBelief(
                  signedIn: SignedInState.notSignedIn)));

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
