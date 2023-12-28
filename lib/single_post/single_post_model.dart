import '/components/p_c_nav_bar_widget.dart';
import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'single_post_widget.dart' show SinglePostWidget;
import 'package:flutter/material.dart';

class SinglePostModel extends FlutterFlowModel<SinglePostWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  String currentPageLink = '';
  // Model for PCNavBar component.
  late PCNavBarModel pCNavBarModel;
  // Model for post component.
  late PostModel postModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pCNavBarModel = createModel(context, () => PCNavBarModel());
    postModel = createModel(context, () => PostModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pCNavBarModel.dispose();
    postModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
