import '/backend/backend.dart';
import '/components/p_c_nav_bar_widget.dart';
import '/components/thread_create_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_post_widget.dart' show CreatePostWidget;
import 'package:flutter/material.dart';

class CreatePostModel extends FlutterFlowModel<CreatePostWidget> {
  ///  Local state fields for this page.

  List<ImageHashStruct> images = [];
  void addToImages(ImageHashStruct item) => images.add(item);
  void removeFromImages(ImageHashStruct item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, ImageHashStruct item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(ImageHashStruct) updateFn) =>
      images[index] = updateFn(images[index]);

  bool option3 = true;

  bool option4 = true;

  int isMorePressed = 0;

  bool isPoll = true;

  List<String> options = [];
  void addToOptions(String item) => options.add(item);
  void removeFromOptions(String item) => options.remove(item);
  void removeAtIndexFromOptions(int index) => options.removeAt(index);
  void insertAtIndexInOptions(int index, String item) =>
      options.insert(index, item);
  void updateOptionsAtIndex(int index, Function(String) updateFn) =>
      options[index] = updateFn(options[index]);

  bool isSpoiler = true;

  String postID = 'a';

  String apiKey = '0000';

  bool isSettings = false;

  bool isStealthBypass = false;

  bool isCommentAllowed = true;

  bool isPrivate = false;

  bool isAiEnabled = false;

  bool isShorts = false;

  ThreadStruct? thread;
  void updateThreadStruct(Function(ThreadStruct) updateFn) =>
      updateFn(thread ??= ThreadStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PCNavBar component.
  late PCNavBarModel pCNavBarModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PostsRecord? post;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Model for threadCreate component.
  late ThreadCreateModel threadCreateModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pCNavBarModel = createModel(context, () => PCNavBarModel());
    threadCreateModel = createModel(context, () => ThreadCreateModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pCNavBarModel.dispose();
    tabBarController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    threadCreateModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
