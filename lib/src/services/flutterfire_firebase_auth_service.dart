library flutterfire_firebase_auth_service;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_service_interface/firebase_auth_service_interface.dart';
import 'package:types_for_auth/types_for_auth.dart';

import '../utils/user_extension.dart';

/// A Firebase Auth service, implementing firebase_auth_service_interface by wrapping Flutterfire's firebase_auth plugin.
class FlutterfireFirebaseAuthService implements FirebaseAuthService {
  FlutterfireFirebaseAuthService({FirebaseAuth? plugin})
      : _plugin = plugin ?? FirebaseAuth.instance;

  final FirebaseAuth _plugin;

  @override
  Future<String?>? getCurrentIdToken() {
    return _plugin.currentUser?.getIdToken();
  }

  @override
  String? getCurrentUserId() {
    return _plugin.currentUser?.uid;
  }

  @override
  Future<Set<ProviderEnum>> retrieveProvidersFor(String email) async {
    final providerNames = await _plugin.fetchSignInMethodsForEmail(email);
    final providers =
        providerNames.map((name) => ProviderEnum.values.byName(name));
    return {...providers};
  }

  @override
  Stream<UserAuthState> get onAuthStateChange {
    return _plugin.authStateChanges().map((user) => user.toBelief());
  }

  @override
  Future<UserAuthState> signInWithApple(
      {required String idToken, required String rawNonce}) async {
    // Create an `OAuthCredential` from the credential returned by an auth provider.
    final oauthCredential = OAuthProvider('apple.com').credential(
      idToken: idToken,
      rawNonce: rawNonce,
    );

    // Sign in with Firebase. If the nonce we generated earlier does
    // not match the nonce in the identityToken, sign in will fail.
    UserCredential credential =
        await _plugin.signInWithCredential(oauthCredential);

    return credential.user.toBelief();
  }

  @override
  Future<UserAuthState> signInWithGoogle(
      {required String accessToken, required String idToken}) async {
    OAuthCredential oauthCredential = GoogleAuthProvider.credential(
      accessToken: accessToken,
      idToken: idToken,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(oauthCredential);

    return userCredential.user.toBelief();
  }

  @override
  Future<UserAuthState> signInAnonymously() async {
    final userCredential = await _plugin.signInAnonymously();
    final firebaseAuthUser = userCredential.user!;

    return firebaseAuthUser.toBelief();
  }

  @override
  Future<UserAuthState> signInWithEmailAndPassword(
      String email, String password) async {
    final credential = await _plugin.signInWithEmailAndPassword(
        email: email, password: password);
    return credential.user.toBelief();
  }

  @override
  Future<UserAuthState> signUpWithEmailAndPassword(
      String email, String password) async {
    final credential = await _plugin.createUserWithEmailAndPassword(
        email: email, password: password);
    return credential.user.toBelief();
  }

  @override
  Future<void> signOut() async => _plugin.signOut();

  @override
  Future<UserAuthState> linkGoogleAccount(
      {required String accessToken, required String idToken}) async {
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: accessToken,
      idToken: idToken,
    );

    final user = FirebaseAuth.instance.currentUser!;
    final userCredential = await user.linkWithCredential(authCredential);

    return userCredential.user.toBelief();
  }

  @override
  Future<UserAuthState> linkAppleAccount(
      {required String idToken, required String rawNonce}) async {
    // Create an `OAuthCredential` from the credential returned by an auth provider.
    final oauthCredential = OAuthProvider('apple.com').credential(
      idToken: idToken,
      rawNonce: rawNonce,
    );

    // Sign in with Firebase. If the nonce we generated earlier does
    // not match the nonce in the identityToken, sign in will fail.
    UserCredential credential =
        await _plugin.signInWithCredential(oauthCredential);

    return credential.user.toBelief();
  }
}
