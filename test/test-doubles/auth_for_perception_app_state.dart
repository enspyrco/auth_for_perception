import 'package:firebase_auth_service_flutterfire/auth_state_flutterfire.dart';
import 'package:types_for_perception/auth_beliefs.dart';
import 'package:types_for_perception/beliefs.dart';

class AstroAuthAppState implements CoreBeliefs, AuthConcept {
  AstroAuthAppState({required this.auth});

  static AstroAuthAppState get initial =>
      AstroAuthAppState(auth: const AuthStateFlutterfire());

  @override
  final AuthStateFlutterfire auth;

  @override
  AstroAuthAppState copyWith({AuthStateFlutterfire? auth}) {
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
