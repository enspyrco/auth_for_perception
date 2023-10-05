import 'package:abstractions/beliefs.dart';
import 'package:percepts/percepts.dart';

class UpdateUserState<T extends CoreBeliefs> extends Conclusion<T> {
  const UpdateUserState(this.userAuthState);

  final DefaultUserAuthState userAuthState;

  @override
  T conclude(T beliefs) {
    return (beliefs as dynamic).copyWith(
        auth: (beliefs as dynamic)
            .identity
            .copyWith(userAuthState: userAuthState)) as T;
  }

  @override
  toJson() => {
        'name_': 'Update User State',
        'state_': <String, dynamic>{'user': userAuthState.toJson()}
      };
}
