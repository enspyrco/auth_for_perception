import 'package:types_for_auth/types_for_auth.dart';
import 'package:abstractions/beliefs.dart';

class UpdateUserAuthState<T extends CoreBeliefs> extends Conclusion<T> {
  const UpdateUserAuthState(this.userAuthState);

  final UserAuthState userAuthState;

  @override
  T conclude(T beliefs) {
    return (beliefs as dynamic).copyWith(
        identity: (beliefs as dynamic)
            .identity
            .copyWith(userAuthState: userAuthState)) as T;
  }

  @override
  toJson() => {
        'name_': 'Update User State',
        'state_': <String, dynamic>{
          'user': <String, dynamic>{
            'signedIn': userAuthState.signedIn,
            'displayName': userAuthState.displayName,
            'photoURL': userAuthState.photoURL,
            'uid': userAuthState.uid,
          }
        }
      };
}
