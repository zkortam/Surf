import '/backend/backend.dart';
import '/components/p_c_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_search_widget.dart' show ChatSearchWidget;
import 'package:flutter/material.dart';

class ChatSearchModel extends FlutterFlowModel<ChatSearchWidget> {
  ///  Local state fields for this page.

  List<String> usersList = [];
  void addToUsersList(String item) => usersList.add(item);
  void removeFromUsersList(String item) => usersList.remove(item);
  void removeAtIndexFromUsersList(int index) => usersList.removeAt(index);
  void insertAtIndexInUsersList(int index, String item) =>
      usersList.insert(index, item);
  void updateUsersListAtIndex(int index, Function(String) updateFn) =>
      usersList[index] = updateFn(usersList[index]);

  List<String> usernamelist = [];
  void addToUsernamelist(String item) => usernamelist.add(item);
  void removeFromUsernamelist(String item) => usernamelist.remove(item);
  void removeAtIndexFromUsernamelist(int index) => usernamelist.removeAt(index);
  void insertAtIndexInUsernamelist(int index, String item) =>
      usernamelist.insert(index, item);
  void updateUsernamelistAtIndex(int index, Function(String) updateFn) =>
      usernamelist[index] = updateFn(usernamelist[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PCNavBar component.
  late PCNavBarModel pCNavBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Algolia Search Results from action on TextField
  List<UsersRecord>? algoliaSearchResults = [];
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  ChatsRecord? query;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ChatsRecord? chat;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pCNavBarModel = createModel(context, () => PCNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pCNavBarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
