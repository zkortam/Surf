import '/components/p_c_nav_bar_widget.dart';
import '/components/threads_bar_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'spaces_widget.dart' show SpacesWidget;
import 'package:flutter/material.dart';

class SpacesModel extends FlutterFlowModel<SpacesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PCNavBar component.
  late PCNavBarModel pCNavBarModel;
  // Model for ThreadsBarCopy component.
  late ThreadsBarCopyModel threadsBarCopyModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pCNavBarModel = createModel(context, () => PCNavBarModel());
    threadsBarCopyModel = createModel(context, () => ThreadsBarCopyModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pCNavBarModel.dispose();
    threadsBarCopyModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
