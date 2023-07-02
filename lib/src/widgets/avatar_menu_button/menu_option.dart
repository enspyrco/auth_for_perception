import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:types_for_perception/core_types.dart';
import 'package:types_for_perception/state_types.dart';
import 'package:flutter/widgets.dart';

class MenuOption {
  const MenuOption(this.name, this.mission);

  final String name;
  final Mission mission;

  dynamic startMission<S extends AstroState>(BuildContext context) =>
      mission is AwayMission
          ? locate<MissionControl<S>>().launch(mission as AwayMission<S>)
          : locate<MissionControl<S>>().land(mission as LandingMission<S>);
}
