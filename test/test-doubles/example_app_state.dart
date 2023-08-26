import 'package:firebase_auth_service_flutterfire/auth_state_flutterfire.dart';
import 'package:types_for_perception/auth_beliefs.dart';
import 'package:types_for_perception/beliefs.dart';

class ExampleAppState implements CoreBeliefs, AuthConcept {
  ExampleAppState({required this.auth});

  static ExampleAppState get initial =>
      ExampleAppState(auth: const AuthStateFlutterfire());

  @override
  final AuthStateFlutterfire auth;

  @override
  ExampleAppState copyWith({AuthStateFlutterfire? auth}) {
    return ExampleAppState(auth: auth ?? this.auth);
  }

  @override
  toJson() => {'auth': auth.toJson()};

  @override
  bool operator ==(Object other) =>
      other is ExampleAppState && other.auth == auth;

  @override
  int get hashCode => auth.hashCode;
}
