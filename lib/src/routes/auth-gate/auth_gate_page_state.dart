import 'package:types_for_perception/navigation_types.dart';
import 'package:types_for_perception/state_types.dart';

class AuthGatePageState implements PageState, AstroState {
  const AuthGatePageState();

  @override
  AuthGatePageState copyWith() => this;

  @override
  toJson() => {'type': 'AuthGatePageState'};
}
