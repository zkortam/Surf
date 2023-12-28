import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'scroll_post_widget.dart' show ScrollPostWidget;
import 'package:flutter/material.dart';

class ScrollPostModel extends FlutterFlowModel<ScrollPostWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Model for post component.
  late PostModel postModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController = ScrollController();
    postModel2 = createModel(context, () => PostModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    columnController?.dispose();
    listViewController?.dispose();
    postModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
