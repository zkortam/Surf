import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/p_c_nav_bar_widget.dart';
import '/components/space_threads_nav_widget.dart';
import '/components/thread_create_widget.dart';
import '/components/thread_widget.dart';
import '/components/threads_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'threads_model.dart';
export 'threads_model.dart';

class ThreadsWidget extends StatefulWidget {
  const ThreadsWidget({super.key});

  @override
  _ThreadsWidgetState createState() => _ThreadsWidgetState();
}

class _ThreadsWidgetState extends State<ThreadsWidget>
    with TickerProviderStateMixin {
  late ThreadsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'threadOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(-48.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'threadOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(-48.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'threadOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(-48.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThreadsModel());

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
        title: 'Threads',
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
              child: Stack(
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                  ))
                    Row(
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
                            child: const PCNavBarWidget(
                              currentPage: 1,
                            ),
                          ),
                        Flexible(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.threadCreateModel1,
                                        updateCallback: () => setState(() {}),
                                        child: const ThreadCreateWidget(
                                          isPostingPage: false,
                                          isPrivate: false,
                                          isCommentAllowed: false,
                                          isStealthSetting: false,
                                        ),
                                      ),
                                    ),
                                    if (responsiveVisibility(
                                      context: context,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            5.0, 5.0, 5.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            gradient: const LinearGradient(
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
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.75,
                                                  height: 50.0,
                                                  decoration: const BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'ut05kijl' /* Threads */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                FlutterFlowIconButton(
                                                  borderColor: Colors.white,
                                                  borderRadius: 25.0,
                                                  borderWidth: 3.0,
                                                  buttonSize: 40.0,
                                                  icon: const FaIcon(
                                                    FontAwesomeIcons.search,
                                                    color: Colors.white,
                                                    size: 15.0,
                                                  ),
                                                  onPressed: () async {
                                                    context.pushNamed('Search');
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    Stack(
                                      children: [
                                        if (!_model.isFollowersOnly)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: StreamBuilder<
                                                List<ThreadRecord>>(
                                              stream: queryThreadRecord(
                                                queryBuilder: (threadRecord) =>
                                                    threadRecord.orderBy(
                                                        'thread.timestamp',
                                                        descending: true),
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
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: ThreadWidget(
                                                        key: Key(
                                                            'Key5kl_${columnIndex}_of_${columnThreadRecordList.length}'),
                                                        thread:
                                                            columnThreadRecord,
                                                        isComment:
                                                            columnThreadRecord
                                                                    .thread
                                                                    .comments
                                                                    .length >
                                                                2,
                                                        isCommentAllowed: _model
                                                            .isCommentAllowed,
                                                      ).animateOnPageLoad(
                                                          animationsMap[
                                                              'threadOnPageLoadAnimation1']!),
                                                    );
                                                  })
                                                      .divide(const SizedBox(
                                                          height: 10.0))
                                                      .around(const SizedBox(
                                                          height: 10.0)),
                                                );
                                              },
                                            ),
                                          ),
                                        if (_model.isFollowersOnly)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  StreamBuilder<
                                                      List<ThreadRecord>>(
                                                stream: queryThreadRecord(
                                                  queryBuilder: (threadRecord) =>
                                                      threadRecord
                                                          .whereIn(
                                                              'thread.author',
                                                              (currentUserDocument
                                                                      ?.following
                                                                      .toList() ??
                                                                  []))
                                                          .orderBy(
                                                              'thread.timestamp',
                                                              descending: true),
                                                ),
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
                                                  List<ThreadRecord>
                                                      columnThreadRecordList =
                                                      snapshot.data!;
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
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: ThreadWidget(
                                                          key: Key(
                                                              'Keyw84_${columnIndex}_of_${columnThreadRecordList.length}'),
                                                          thread:
                                                              columnThreadRecord,
                                                          isComment:
                                                              columnThreadRecord
                                                                      .thread
                                                                      .comments
                                                                      .length >
                                                                  2,
                                                          isCommentAllowed: _model
                                                              .isCommentAllowed,
                                                        ).animateOnPageLoad(
                                                            animationsMap[
                                                                'threadOnPageLoadAnimation2']!),
                                                      );
                                                    })
                                                        .divide(const SizedBox(
                                                            height: 10.0))
                                                        .around(const SizedBox(
                                                            height: 10.0)),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Container(
                                  width: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(200.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 5.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: valueOrDefault<Color>(
                                            _model.isCommentAllowed
                                                ? const Color(0xFF168323)
                                                : const Color(0xFFC91212),
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                          borderRadius: 20.0,
                                          borderWidth: 3.0,
                                          buttonSize: 40.0,
                                          hoverIconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          icon: Icon(
                                            Icons.insert_comment_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 20.0,
                                          ),
                                          onPressed: () async {
                                            if (_model.isCommentAllowed) {
                                              setState(() {
                                                _model.isCommentAllowed = false;
                                              });
                                            } else {
                                              setState(() {
                                                _model.isCommentAllowed = true;
                                              });
                                            }
                                          },
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor: _model.isFollowersOnly
                                              ? const Color(0xFFF5C338)
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          borderRadius: 20.0,
                                          borderWidth: 3.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.auto_awesome_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 22.0,
                                          ),
                                          onPressed: () async {
                                            if (_model.isFollowersOnly) {
                                              setState(() {
                                                _model.isFollowersOnly = false;
                                              });
                                            } else {
                                              setState(() {
                                                _model.isFollowersOnly = true;
                                              });
                                            }
                                          },
                                        ),
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          borderRadius: 20.0,
                                          borderWidth: 3.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.grain,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 22.0,
                                          ),
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        const SpaceThreadsNavWidget(),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                        ),
                                      ].divide(const SizedBox(height: 5.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (responsiveVisibility(
                    context: context,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.threadsBarModel,
                            updateCallback: () => setState(() {}),
                            child: const Hero(
                              tag: 'spaces',
                              transitionOnUserGestures: true,
                              child: Material(
                                color: Colors.transparent,
                                child: ThreadsBarWidget(),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 0.0),
                            child: wrapWithModel(
                              model: _model.threadCreateModel2,
                              updateCallback: () => setState(() {}),
                              child: const ThreadCreateWidget(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: StreamBuilder<List<ThreadRecord>>(
                              stream: queryThreadRecord(
                                queryBuilder: (threadRecord) =>
                                    threadRecord.orderBy('thread.timestamp',
                                        descending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitRipple(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<ThreadRecord> columnThreadRecordList =
                                    snapshot.data!;
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                          columnThreadRecordList.length,
                                          (columnIndex) {
                                    final columnThreadRecord =
                                        columnThreadRecordList[columnIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: ThreadWidget(
                                        key: Key(
                                            'Key1c5_${columnIndex}_of_${columnThreadRecordList.length}'),
                                        thread: columnThreadRecord,
                                        isComment: false,
                                        isCommentAllowed: false,
                                      ).animateOnPageLoad(animationsMap[
                                          'threadOnPageLoadAnimation3']!),
                                    );
                                  })
                                      .divide(const SizedBox(height: 10.0))
                                      .around(const SizedBox(height: 10.0)),
                                );
                              },
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
