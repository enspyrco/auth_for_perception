import 'package:abstractions/beliefs.dart';
import 'package:abstractions/framing.dart';

class AuthGatePageState implements FramingLayer, CoreBeliefs {
  const AuthGatePageState();

  @override
  AuthGatePageState copyWith() => this;

  @override
  toJson() => {'type': 'AuthGatePageState'};
}
