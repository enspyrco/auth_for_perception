import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:types_for_perception/core_types.dart';
import 'package:types_for_perception/json_types.dart';
import 'package:types_for_perception/state_types.dart';
import 'package:firebase_auth_service_interface/firebase_auth_service_interface.dart';

class SignOut<T extends AstroState> extends AwayMission<T> {
  const SignOut();

  @override
  Future<void> flightPlan(MissionControl<T> missionControl) async {
    var service = locate<FirebaseAuthService>();
    await service.signOut();
  }

  @override
  JsonMap toJson() => {'name_': 'Sign Out', 'state_': <String, dynamic>{}};
}
