import 'package:json_utils/json_utils.dart';
import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:abstractions/beliefs.dart';

import '../subsystems/flutterfire_firebase_auth_subsystem.dart';

class SigningOut<T extends CoreBeliefs> extends Consideration<T> {
  const SigningOut();

  @override
  Future<void> consider(BeliefSystem<T> beliefSystem) async {
    var service = locate<FlutterfireFirebaseAuthSubsystem>();
    await service.signOut();
  }

  @override
  JsonMap toJson() =>
      {'name_': 'SigningOutOfFirebase', 'state_': <String, dynamic>{}};
}
