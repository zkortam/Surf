import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'email_verification_widget.dart' show EmailVerificationWidget;
import 'package:flutter/material.dart';

class EmailVerificationModel extends FlutterFlowModel<EmailVerificationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? instantTimer;
  InstantTimer? testing;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
    testing?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
