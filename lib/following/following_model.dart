import '/components/p_c_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'following_widget.dart' show FollowingWidget;
import 'package:flutter/material.dart';

class FollowingModel extends FlutterFlowModel<FollowingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PCNavBar component.
  late PCNavBarModel pCNavBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pCNavBarModel = createModel(context, () => PCNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pCNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
