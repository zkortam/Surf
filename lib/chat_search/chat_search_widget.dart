import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/message_card_widget.dart';
import '/components/p_c_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_search_model.dart';
export 'chat_search_model.dart';

class ChatSearchWidget extends StatefulWidget {
  const ChatSearchWidget({Key? key}) : super(key: key);

  @override
  _ChatSearchWidgetState createState() => _ChatSearchWidgetState();
}

class _ChatSearchWidgetState extends State<ChatSearchWidget> {
  late ChatSearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatSearchModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Title(
        title: 'chatSearch',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.pCNavBarModel,
                    updateCallback: () => setState(() {}),
                    child: PCNavBarWidget(
                      currentPage: 3,
                    ),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            width: 700.0,
                            height: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 24.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pop();
                                                    },
                                                    child: Icon(
                                                      Icons.arrow_back,
                                                      color: Color(0xFFBDBDBD),
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '1veqvlop' /* Users */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 16.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 24.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            safeSetState(() => _model
                                                .algoliaSearchResults = null);
                                            await UsersRecord.search(
                                              term: _model.textController.text,
                                            )
                                                .then((r) => _model
                                                    .algoliaSearchResults = r)
                                                .onError((_, __) => _model
                                                    .algoliaSearchResults = [])
                                                .whenComplete(
                                                    () => setState(() {}));
                                          },
                                        ),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: FFLocalizations.of(context)
                                              .getText(
                                            'woily23q' /* Search for user */,
                                          ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Color(0xFFBDBDBD),
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF828282),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(500.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(500.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(500.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(500.0),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.search_sharp,
                                          ),
                                          suffixIcon: _model.textController!
                                                  .text.isNotEmpty
                                              ? InkWell(
                                                  onTap: () async {
                                                    _model.textController
                                                        ?.clear();
                                                    safeSetState(() => _model
                                                            .algoliaSearchResults =
                                                        null);
                                                    await UsersRecord.search(
                                                      term: _model
                                                          .textController.text,
                                                    )
                                                        .then((r) => _model
                                                                .algoliaSearchResults =
                                                            r)
                                                        .onError((_, __) =>
                                                            _model.algoliaSearchResults =
                                                                [])
                                                        .whenComplete(() =>
                                                            setState(() {}));

                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: Color(0xFF757575),
                                                    size: 22.0,
                                                  ),
                                                )
                                              : null,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 10.0, 10.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) =>
                                        FutureBuilder<List<UsersRecord>>(
                                      future: UsersRecord.search(
                                        term: currentUserDisplayName ==
                                                _model.textController.text
                                            ? ''
                                            : _model.textController.text,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitRipple(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<UsersRecord>
                                            columnUsersRecordList =
                                            snapshot.data!;
                                        // Customize what your widget looks like with no search results.
                                        if (snapshot.data!.isEmpty) {
                                          return Container(
                                            height: 100,
                                            child: Center(
                                              child: Text('No results.'),
                                            ),
                                          );
                                        }
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              columnUsersRecordList.length,
                                              (columnIndex) {
                                            final columnUsersRecord =
                                                columnUsersRecordList[
                                                    columnIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: FutureBuilder<
                                                  List<ChatsRecord>>(
                                                future: queryChatsRecordOnce(),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child: SpinKitRipple(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<ChatsRecord>
                                                      messageCardChatsRecordList =
                                                      snapshot.data!;
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (functions.findpreexistingchatifpossible(
                                                              messageCardChatsRecordList
                                                                  .toList(),
                                                              currentUserReference!,
                                                              columnUsersRecord
                                                                  .reference) !=
                                                          null) {
                                                        context.pushNamed(
                                                          'chats_page',
                                                          queryParameters: {
                                                            'userName':
                                                                serializeParam(
                                                              columnUsersRecord
                                                                  .displayName,
                                                              ParamType.String,
                                                            ),
                                                            'email':
                                                                serializeParam(
                                                              columnUsersRecord
                                                                  .email,
                                                              ParamType.String,
                                                            ),
                                                            'chatUser':
                                                                serializeParam(
                                                              functions
                                                                  .findpreexistingchatifpossible(
                                                                      messageCardChatsRecordList
                                                                          .toList(),
                                                                      currentUserReference!,
                                                                      columnUsersRecord
                                                                          .reference)
                                                                  ?.reference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'userRef':
                                                                serializeParam(
                                                              currentUserReference,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'userProfile':
                                                                serializeParam(
                                                              columnUsersRecord
                                                                  .photoUrl,
                                                              ParamType.String,
                                                            ),
                                                            'userb':
                                                                serializeParam(
                                                              functions
                                                                  .findpreexistingchatifpossible(
                                                                      messageCardChatsRecordList
                                                                          .toList(),
                                                                      currentUserReference!,
                                                                      columnUsersRecord
                                                                          .reference)
                                                                  ?.userB,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                            'usera':
                                                                serializeParam(
                                                              functions
                                                                  .findpreexistingchatifpossible(
                                                                      messageCardChatsRecordList
                                                                          .toList(),
                                                                      currentUserReference!,
                                                                      columnUsersRecord
                                                                          .reference)
                                                                  ?.userA,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                            ),
                                                          },
                                                        );
                                                      } else {
                                                        await ChatsRecord
                                                            .collection
                                                            .doc()
                                                            .set(
                                                                createChatsRecordData(
                                                              user:
                                                                  currentUserReference,
                                                              userA:
                                                                  currentUserReference,
                                                              userB:
                                                                  columnUsersRecord
                                                                      .reference,
                                                              lastMessage: 'NA',
                                                              lastMessageTime:
                                                                  getCurrentTimestamp,
                                                              image:
                                                                  columnUsersRecord
                                                                      .photoUrl,
                                                              messageSeen:
                                                                  false,
                                                            ));

                                                        context.pushNamed(
                                                            'chat_main');
                                                      }
                                                    },
                                                    child: MessageCardWidget(
                                                      key: Key(
                                                          'Keyd0y_${columnIndex}_of_${columnUsersRecordList.length}'),
                                                      user: columnUsersRecord,
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          }).divide(SizedBox(height: 10.0)),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
