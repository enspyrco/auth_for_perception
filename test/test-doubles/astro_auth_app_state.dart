import 'package:abstractions/identity.dart';
import 'package:abstractions/beliefs.dart';
import 'package:percepts/percepts.dart';

class AstroAuthAppState implements CoreBeliefs, IdentityConcept {
  AstroAuthAppState({required this.identity});

  static AstroAuthAppState get initial =>
      AstroAuthAppState(identity: DefaultIdentityBeliefs.initial);

  @override
  final DefaultIdentityBeliefs identity;

  @override
  AstroAuthAppState copyWith({DefaultIdentityBeliefs? identity}) {
    return AstroAuthAppState(identity: identity ?? this.identity);
  }

  @override
  toJson() => {'identity': identity.toJson()};

  @override
  bool operator ==(Object other) =>
      other is AstroAuthAppState && other.identity == identity;

  @override
  int get hashCode => identity.hashCode;
}
