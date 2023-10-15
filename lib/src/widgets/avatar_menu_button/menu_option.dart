import 'package:locator_for_perception/locator_for_perception.dart';
import 'package:flutter/widgets.dart';
import 'package:abstractions/beliefs.dart';

class MenuOption {
  const MenuOption(this.name, this.cognition);

  final String name;
  final Cognition cognition;

  dynamic startMission<S extends CoreBeliefs>(BuildContext context) =>
      cognition is Consideration
          ? locate<BeliefSystem<S>>().consider(cognition as Consideration<S>)
          : locate<BeliefSystem<S>>().conclude(cognition as Conclusion<S>);
}
