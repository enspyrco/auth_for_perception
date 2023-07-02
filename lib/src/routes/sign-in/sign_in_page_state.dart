import 'package:types_for_perception/navigation_types.dart';
import 'package:types_for_perception/state_types.dart';

class SignInPageState implements PageState, AstroState {
  const SignInPageState();

  @override
  SignInPageState copyWith() => this;

  @override
  toJson() => {'type': 'SignInPageState'};
}
