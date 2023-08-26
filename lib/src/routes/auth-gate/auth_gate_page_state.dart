import 'package:types_for_perception/beliefs.dart';
import 'package:types_for_perception/navigation_types.dart';

class AuthGatePageState implements PageState, CoreBeliefs {
  const AuthGatePageState();

  @override
  AuthGatePageState copyWith() => this;

  @override
  toJson() => {'type': 'AuthGatePageState'};
}
