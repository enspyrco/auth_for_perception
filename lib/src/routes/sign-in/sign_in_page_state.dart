import 'package:types_for_perception/beliefs.dart';
import 'package:types_for_perception/navigation_types.dart';

class SignInPageState implements PageState, CoreBeliefs {
  const SignInPageState();

  @override
  SignInPageState copyWith() => this;

  @override
  toJson() => {'type': 'SignInPageState'};
}
