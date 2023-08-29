import 'package:abstractions/beliefs.dart';

class OnAuthStateChange<S extends CoreBeliefs> {
  OnAuthStateChange({
    List<Consideration<S>>? launchOnSignedIn,
    List<Conclusion<S>>? landOnSignedIn,
    List<Consideration<S>>? launchOnSignedOut,
    List<Conclusion<S>>? landOnSignedOut,
  })  : _launchOnSignedIn = launchOnSignedIn ?? [],
        _landOnSignedIn = landOnSignedIn ?? [],
        _launchOnSignedOut = launchOnSignedOut ?? [],
        _landOnSignedOut = landOnSignedOut ?? [];

  final List<Consideration<S>> _launchOnSignedIn;
  final List<Conclusion<S>> _landOnSignedIn;
  final List<Consideration<S>> _launchOnSignedOut;
  final List<Conclusion<S>> _landOnSignedOut;

  List<Consideration<S>> get launchOnSignedIn => _launchOnSignedIn;
  List<Conclusion<S>> get landOnSignedIn => _landOnSignedIn;
  List<Consideration<S>> get launchOnSignedOut => _launchOnSignedOut;
  List<Conclusion<S>> get landOnSignedOut => _landOnSignedOut;

  void add(
      {List<Consideration<S>>? launchOnSignedIn,
      List<Conclusion<S>>? landingMissions,
      List<Consideration<S>>? launchOnSignedOut,
      List<Conclusion<S>>? landOnSignedOut}) {
    _launchOnSignedIn.addAll(launchOnSignedIn ?? []);
    _landOnSignedIn.addAll(landingMissions ?? []);
    _launchOnSignedOut.addAll(launchOnSignedOut ?? []);
    _landOnSignedOut.addAll(landOnSignedOut ?? []);
  }
}
