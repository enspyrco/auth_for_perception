import 'package:abstractions/beliefs.dart';
import 'package:abstractions/framing.dart';

class SignInPageState implements FramingLayer, CoreBeliefs {
  const SignInPageState();

  @override
  SignInPageState copyWith() => this;

  @override
  toJson() => {'type': 'SignInPageState'};
}
