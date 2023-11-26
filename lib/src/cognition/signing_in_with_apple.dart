import 'package:json_utils/json_utils.dart';
import 'package:abstractions/beliefs.dart';
import 'package:locator_for_perception/locator_for_perception.dart';

import '../subsystems/flutterfire_firebase_auth_subsystem.dart';

class SigningInWithApple<T extends CoreBeliefs> extends Consideration<T> {
  const SigningInWithApple({this.isWeb = false});

  final bool isWeb;

  @override
  Future<void> consider(BeliefSystem<T> beliefSystem) async {
    final service = locate<FlutterfireFirebaseAuthSubsystem>();
    await service.signInToAppleThenFirebase();
  }

  @override
  JsonMap toJson() => {
        'name_': 'SigningInWithApple',
        'state_': <String, Object?>{'isWeb': isWeb},
      };
}
