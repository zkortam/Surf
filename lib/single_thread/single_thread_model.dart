import '/components/p_c_nav_bar_widget.dart';
import '/components/thread_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'single_thread_widget.dart' show SingleThreadWidget;
import 'package:flutter/material.dart';

class SingleThreadModel extends FlutterFlowModel<SingleThreadWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  String currentPageLink = '';
  // Model for PCNavBar component.
  late PCNavBarModel pCNavBarModel;
  // Model for thread component.
  late ThreadModel threadModel;
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
    threadModel = createModel(context, () => ThreadModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pCNavBarModel.dispose();
    threadModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
