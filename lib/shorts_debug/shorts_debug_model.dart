import '/flutter_flow/flutter_flow_util.dart';
import 'shorts_debug_widget.dart' show ShortsDebugWidget;
import 'package:flutter/material.dart';

class ShortsDebugModel extends FlutterFlowModel<ShortsDebugWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for URL widget.
  FocusNode? urlFocusNode;
  TextEditingController? urlController;
  String? Function(BuildContext, String?)? urlControllerValidator;
  // State field(s) for Caption widget.
  FocusNode? captionFocusNode;
  TextEditingController? captionController;
  String? Function(BuildContext, String?)? captionControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    urlFocusNode?.dispose();
    urlController?.dispose();

    captionFocusNode?.dispose();
    captionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
