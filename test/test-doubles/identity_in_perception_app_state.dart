import 'package:flutterfire_firebase_auth_service/flutterfire_identity_beliefs.dart';
import 'package:abstractions/identity.dart';
import 'package:abstractions/beliefs.dart';

class AstroAuthAppState implements CoreBeliefs, IdentityConcept {
  AstroAuthAppState({required this.auth});

  static AstroAuthAppState get initial =>
      AstroAuthAppState(auth: const FlutterfireIdentityBeliefs());

  @override
  final FlutterfireIdentityBeliefs auth;

  @override
  AstroAuthAppState copyWith({FlutterfireIdentityBeliefs? auth}) {
    return AstroAuthAppState(auth: auth ?? this.auth);
  }

  @override
  toJson() => {'auth': auth.toJson()};

  @override
  bool operator ==(Object other) =>
      other is AstroAuthAppState && other.auth == auth;

  @override
  int get hashCode => auth.hashCode;
}
