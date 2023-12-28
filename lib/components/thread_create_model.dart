import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'thread_create_widget.dart' show ThreadCreateWidget;
import 'package:flutter/material.dart';

class ThreadCreateModel extends FlutterFlowModel<ThreadCreateWidget> {
  ///  Local state fields for this component.

  bool isPoll = false;

  bool option3 = false;

  bool option4 = false;

  List<String> options = [];
  void addToOptions(String item) => options.add(item);
  void removeFromOptions(String item) => options.remove(item);
  void removeAtIndexFromOptions(int index) => options.removeAt(index);
  void insertAtIndexInOptions(int index, String item) =>
      options.insert(index, item);
  void updateOptionsAtIndex(int index, Function(String) updateFn) =>
      options[index] = updateFn(options[index]);

  int isMorePressed = 0;

  ThreadStruct? thread;
  void updateThreadStruct(Function(ThreadStruct) updateFn) =>
      updateFn(thread ??= ThreadStruct());

  String apiKey = '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';

  bool isSettings = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleController;
  String? Function(BuildContext, String?)? titleControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for Option3 widget.
  FocusNode? option3FocusNode;
  TextEditingController? option3Controller;
  String? Function(BuildContext, String?)? option3ControllerValidator;
  // State field(s) for Option4 widget.
  FocusNode? option4FocusNode;
  TextEditingController? option4Controller;
  String? Function(BuildContext, String?)? option4ControllerValidator;
  // Stores action output result for [Custom Action - chatGPT] action in IconButton widget.
  String? gptOut;
  // Stores action output result for [Custom Action - chatGPT] action in Button widget.
  String? threadSummary;
  // Stores action output result for [Custom Action - chatGPT] action in Button widget.
  String? isPolitical;
  // Stores action output result for [Custom Action - chatGPT] action in Button widget.
  String? threadPolitical;
  // Stores action output result for [Custom Action - chatGPT] action in Button widget.
  String? fixed;
  // Stores action output result for [Custom Action - chatGPT] action in Button widget.
  String? autoHashtag;
  // State field(s) for ABPC widget.
  String? abpcValue;
  FormFieldController<List<String>>? abpcValueController;
  // State field(s) for AHPC widget.
  String? ahpcValue;
  FormFieldController<List<String>>? ahpcValueController;
  // State field(s) for EAIFPC widget.
  String? eaifpcValue;
  FormFieldController<List<String>>? eaifpcValueController;
  // State field(s) for EnableComment widget.
  String? enableCommentValue;
  FormFieldController<List<String>>? enableCommentValueController;
  // State field(s) for PrivateThread widget.
  String? privateThreadValue;
  FormFieldController<List<String>>? privateThreadValueController;
  // State field(s) for StealthThread widget.
  String? stealthThreadValue;
  FormFieldController<List<String>>? stealthThreadValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();

    option3FocusNode?.dispose();
    option3Controller?.dispose();

    option4FocusNode?.dispose();
    option4Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
