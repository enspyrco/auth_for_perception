library identity_in_perception;

import 'package:flutterfire_firebase_auth_service/flutterfire_identity_beliefs.dart';
import 'package:flutterfire_firebase_auth_service/flutterfire_user_auth_belief.dart';

export 'src/percepts/beliefs/default_identity_beliefs.dart';
export 'src/percepts/cognition/bind_auth_state.dart';
export 'src/percepts/cognition/sign_out.dart';
export 'src/percepts/framing/auth-gate/auth_gate_page_state.dart';
export 'src/percepts/framing/auth-gate/auth_gate_screen.dart';
export 'src/percepts/framing/sign-in/sign_in_page_state.dart';
export 'src/percepts/framing/sign-in/sign_in_screen.dart';
export 'src/utils/app_init.dart';
export 'src/utils/on_auth_state_change.dart';
export 'src/widgets/avatar_menu_button/avatar_menu_button.dart';
export 'src/widgets/avatar_menu_button/menu_option.dart';

/// Factory methods for creating AuthState objects
class AuthBeliefSystem {
  static FlutterfireIdentityBeliefs initialBeliefs() =>
      const FlutterfireIdentityBeliefs(user: FlutterfireUserAuthBelief());
}
