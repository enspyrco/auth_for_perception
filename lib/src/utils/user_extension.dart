import 'package:firebase_auth/firebase_auth.dart';
import 'package:types_for_auth/types_for_auth.dart';
import 'package:percepts/percepts.dart';

extension UserExtension on User? {
  UserAuthState toBelief() {
    return DefaultUserAuthState(
        signedIn:
            (this == null) ? SignedInState.notSignedIn : SignedInState.signedIn,
        uid: this?.uid,
        displayName: this?.displayName,
        photoURL: this?.photoURL);
  }
}
