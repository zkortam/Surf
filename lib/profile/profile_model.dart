import '/components/p_c_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PCNavBar component.
  late PCNavBarModel pCNavBarModel;
  String currentPageLink = '';
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pCNavBarModel = createModel(context, () => PCNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pCNavBarModel.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
