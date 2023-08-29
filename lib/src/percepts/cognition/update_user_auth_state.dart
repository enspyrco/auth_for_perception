import 'package:types_for_auth/types_for_auth.dart';
import 'package:abstractions/beliefs.dart';

class UpdateUserAuthState<T extends CoreBeliefs> extends Conclusion<T> {
  const UpdateUserAuthState(this.user);

  final UserAuthState user;

  @override
  T update(T state) {
    return (state as dynamic)
        .copyWith(auth: (state as dynamic).auth.copyWith(user: user)) as T;
  }

  @override
  toJson() => {
        'name_': 'Update User State',
        'state_': <String, dynamic>{
          'user': <String, dynamic>{
            'signedIn': user.signedIn,
            'displayName': user.displayName,
            'photoURL': user.photoURL,
            'uid': user.uid,
          }
        }
      };
}
