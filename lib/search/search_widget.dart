import '/backend/backend.dart';
import '/components/p_c_nav_bar_widget.dart';
import '/components/post_widget.dart';
import '/components/thread_widget.dart';
import '/components/user_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_model.dart';
export 'search_model.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late SearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();
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
        title: 'Search',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                  ))
                    wrapWithModel(
                      model: _model.pCNavBarModel,
                      updateCallback: () => setState(() {}),
                      child: PCNavBarWidget(),
                    ),
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Container(
                            width: 700.0,
                            decoration: BoxDecoration(),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    tablet: false,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 5.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFF9F1CFA),
                                              Color(0xFF0D28A2)
                                            ],
                                            stops: [0.0, 1.0],
                                            begin: AlignmentDirectional(
                                                0.87, -1.0),
                                            end: AlignmentDirectional(
                                                -0.87, 1.0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(200.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: Colors.white,
                                                borderRadius: 25.0,
                                                borderWidth: 3.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons.arrow_back_rounded,
                                                  color: Colors.white,
                                                  size: 15.0,
                                                ),
                                                onPressed: () async {
                                                  context.safePop();
                                                },
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.75,
                                                height: 50.0,
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'rgzutvvn' /* Search */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Colors.white,
                                                            fontSize: 18.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 20.0, 10.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Stack(
                                        children: [
                                          if (_model.isUsers)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController1,
                                                focusNode:
                                                    _model.textFieldFocusNode1,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textController1',
                                                  Duration(milliseconds: 2000),
                                                  () async {
                                                    safeSetState(() => _model
                                                            .algoliaSearchResults1 =
                                                        null);
                                                    await UsersRecord.search(
                                                      term: _model
                                                          .textController1.text,
                                                    )
                                                        .then((r) => _model
                                                                .algoliaSearchResults1 =
                                                            r)
                                                        .onError((_, __) =>
                                                            _model.algoliaSearchResults1 =
                                                                [])
                                                        .whenComplete(() =>
                                                            setState(() {}));
                                                  },
                                                ),
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '1736zwu1' /* Search */,
                                                  ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(5.0, 5.0,
                                                              5.0, 5.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                validator: _model
                                                    .textController1Validator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          if (_model.isPost)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController2,
                                                focusNode:
                                                    _model.textFieldFocusNode2,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textController2',
                                                  Duration(milliseconds: 2000),
                                                  () async {
                                                    safeSetState(() => _model
                                                            .algoliaSearchResults2 =
                                                        null);
                                                    await PostsRecord.search(
                                                      term: _model
                                                          .textController2.text,
                                                    )
                                                        .then((r) => _model
                                                                .algoliaSearchResults2 =
                                                            r)
                                                        .onError((_, __) =>
                                                            _model.algoliaSearchResults2 =
                                                                [])
                                                        .whenComplete(() =>
                                                            setState(() {}));
                                                  },
                                                ),
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'e4ihhv95' /* Search */,
                                                  ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(5.0, 5.0,
                                                              5.0, 5.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                validator: _model
                                                    .textController2Validator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          if (_model.isThreads)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller:
                                                    _model.textController3,
                                                focusNode:
                                                    _model.textFieldFocusNode3,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textController3',
                                                  Duration(milliseconds: 2000),
                                                  () async {
                                                    safeSetState(() => _model
                                                            .algoliaSearchResults3 =
                                                        null);
                                                    await ThreadRecord.search(
                                                      term: _model
                                                          .textController3.text,
                                                    )
                                                        .then((r) => _model
                                                                .algoliaSearchResults3 =
                                                            r)
                                                        .onError((_, __) =>
                                                            _model.algoliaSearchResults3 =
                                                                [])
                                                        .whenComplete(() =>
                                                            setState(() {}));
                                                  },
                                                ),
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  hintText: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'gakls66o' /* Search */,
                                                  ),
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium,
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(5.0, 5.0,
                                                              5.0, 5.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                validator: _model
                                                    .textController3Validator
                                                    .asValidator(context),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if (_model.isUsers) {
                                              setState(() {
                                                _model.isUsers = false;
                                              });
                                            } else {
                                              setState(() {
                                                _model.isPost = false;
                                                _model.isUsers = true;
                                                _model.isThreads = false;
                                              });
                                            }
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'tk4gntji' /* Users */,
                                          ),
                                          options: FFButtonOptions(
                                            height: 30.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: _model.isUsers
                                                ? Color(0xFF5310C9)
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      color: _model.isUsers
                                                          ? Colors.white
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            elevation: 0.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (_model.isThreads) {
                                                setState(() {
                                                  _model.isThreads = false;
                                                });
                                              } else {
                                                setState(() {
                                                  _model.isPost = false;
                                                  _model.isUsers = false;
                                                  _model.isThreads = true;
                                                });
                                              }
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'kdqa0zsv' /* Threads */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 30.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: _model.isThreads
                                                  ? Color(0xFF5310C9)
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: _model.isThreads
                                                            ? Colors.white
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              if (_model.isPost) {
                                                setState(() {
                                                  _model.isPost = false;
                                                });
                                              } else {
                                                setState(() {
                                                  _model.isPost = true;
                                                  _model.isUsers = false;
                                                  _model.isThreads = false;
                                                });
                                              }
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'nwwer9wx' /* Posts */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 30.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: _model.isPost
                                                  ? Color(0xFF5310C9)
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: _model.isPost
                                                            ? Colors.white
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 0.0),
                                    child: Stack(
                                      children: [
                                        if (_model.isUsers)
                                          FutureBuilder<List<UsersRecord>>(
                                            future: UsersRecord.search(
                                              term: _model.textController1.text,
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
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                    columnUsersRecordList
                                                        .length, (columnIndex) {
                                                  final columnUsersRecord =
                                                      columnUsersRecordList[
                                                          columnIndex];
                                                  return UserCardWidget(
                                                    key: Key(
                                                        'Key87e_${columnIndex}_of_${columnUsersRecordList.length}'),
                                                    user: columnUsersRecord,
                                                  );
                                                }).divide(
                                                    SizedBox(height: 10.0)),
                                              );
                                            },
                                          ),
                                        if (_model.isThreads)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 0.0),
                                            child: FutureBuilder<
                                                List<ThreadRecord>>(
                                              future: ThreadRecord.search(
                                                term:
                                                    _model.textController3.text,
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ThreadRecord>
                                                    columnThreadRecordList =
                                                    snapshot.data!;
                                                // Customize what your widget looks like with no search results.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container(
                                                    height: 100,
                                                    child: Center(
                                                      child:
                                                          Text('No results.'),
                                                    ),
                                                  );
                                                }
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      columnThreadRecordList
                                                          .length,
                                                      (columnIndex) {
                                                    final columnThreadRecord =
                                                        columnThreadRecordList[
                                                            columnIndex];
                                                    return ThreadWidget(
                                                      key: Key(
                                                          'Key98z_${columnIndex}_of_${columnThreadRecordList.length}'),
                                                      isComment: false,
                                                      thread:
                                                          columnThreadRecord,
                                                    );
                                                  }).divide(
                                                      SizedBox(height: 10.0)),
                                                );
                                              },
                                            ),
                                          ),
                                        if (_model.isPost)
                                          FutureBuilder<List<PostsRecord>>(
                                            future: PostsRecord.search(
                                              term: _model.textController2.text,
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<PostsRecord>
                                                  columnPostsRecordList =
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
                                                    columnPostsRecordList
                                                        .length, (columnIndex) {
                                                  final columnPostsRecord =
                                                      columnPostsRecordList[
                                                          columnIndex];
                                                  return PostWidget(
                                                    key: Key(
                                                        'Keyn6a_${columnIndex}_of_${columnPostsRecordList.length}'),
                                                    post: columnPostsRecord,
                                                  );
                                                }).divide(
                                                    SizedBox(height: 10.0)),
                                              );
                                            },
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
