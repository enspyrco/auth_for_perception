import 'package:firebase_auth_service_flutterfire/user_auth_state_flutterfire.dart';
import 'package:types_for_perception/beliefs.dart';

class UpdateUserState<T extends CoreBeliefs> extends LandingMission<T> {
  const UpdateUserState(this.user);

  final UserAuthStateFlutterfire user;

  @override
  T landingInstructions(T state) {
    return (state as dynamic)
        .copyWith(auth: (state as dynamic).auth.copyWith(user: user)) as T;
  }

  @override
  toJson() => {
        'name_': 'Update User State',
        'state_': <String, dynamic>{'user': user.toJson()}
      };
}
