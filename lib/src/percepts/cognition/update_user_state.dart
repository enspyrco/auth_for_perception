import 'package:flutterfire_firebase_auth_service/flutterfire_user_auth_belief.dart';
import 'package:abstractions/beliefs.dart';

class UpdateUserState<T extends CoreBeliefs> extends Conclusion<T> {
  const UpdateUserState(this.user);

  final FlutterfireUserAuthBelief user;

  @override
  T conclude(T state) {
    return (state as dynamic)
        .copyWith(auth: (state as dynamic).auth.copyWith(user: user)) as T;
  }

  @override
  toJson() => {
        'name_': 'Update User State',
        'state_': <String, dynamic>{'user': user.toJson()}
      };
}
