

// We need to create top level constants or we get
// Error: Non-redirecting const factory invocation is not a constant expression.
// When we stop using freezed we shouldn't need to do this
// const _pushProfilePageAction = PushRoute(ProfilePageState());

// enum MenuOptionPreset implements MenuOption {
//   accountDetails('Account Details', _pushProfilePageAction),
//   signOut('Sign Out', SignOut());

//   const MenuOptionPreset(this.name, this.mission);

//   @override
//   final String name;
//   @override
//   final Mission mission;

//   @override
//   dynamic startMission<S extends AstroState>(BuildContext context) =>
//       mission is AwayMission
//           ? locate<BeliefSystem<S>>().launch(mission as AwayMission<S>)
//           : locate<BeliefSystem<S>>().land(mission as LandingMission<S>);
// }
