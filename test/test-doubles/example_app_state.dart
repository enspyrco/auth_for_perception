import 'package:abstractions/identity.dart';
import 'package:abstractions/beliefs.dart';
import 'package:percepts/percepts.dart';

class ExampleAppState implements CoreBeliefs, IdentityConcept {
  ExampleAppState({required this.identity});

  static ExampleAppState get initial =>
      ExampleAppState(identity: DefaultIdentityBeliefs.initial);

  @override
  final DefaultIdentityBeliefs identity;

  @override
  ExampleAppState copyWith({DefaultIdentityBeliefs? identity}) {
    return ExampleAppState(identity: identity ?? this.identity);
  }

  @override
  toJson() => {'identity': identity.toJson()};

  @override
  bool operator ==(Object other) =>
      other is ExampleAppState && other.identity == identity;

  @override
  int get hashCode => identity.hashCode;
}
