import 'package:json_utils/json_utils.dart';
import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:firebase_auth_service_interface/firebase_auth_service_interface.dart';
import 'package:types_for_perception/beliefs.dart';

class SignOut<T extends CoreBeliefs> extends AwayMission<T> {
  const SignOut();

  @override
  Future<void> flightPlan(MissionControl<T> missionControl) async {
    var service = locate<FirebaseAuthService>();
    await service.signOut();
  }

  @override
  JsonMap toJson() => {'name_': 'Sign Out', 'state_': <String, dynamic>{}};
}
