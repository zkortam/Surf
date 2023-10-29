import '/backend/backend.dart';
import '/components/p_c_nav_bar_widget.dart';
import '/components/thread_widget.dart';
import '/components/threads_bar_copy_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'spaces_model.dart';
export 'spaces_model.dart';

class SpacesWidget extends StatefulWidget {
  const SpacesWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String? name;

  @override
  _SpacesWidgetState createState() => _SpacesWidgetState();
}

class _SpacesWidgetState extends State<SpacesWidget>
    with TickerProviderStateMixin {
  late SpacesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'threadOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-48.0, 0.0),
          end: Offset(0.0, 0.0),
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
          begin: Offset(-48.0, 0.0),
          end: Offset(0.0, 0.0),
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
    _model = createModel(context, () => SpacesModel());

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

    return StreamBuilder<List<SpacesRecord>>(
      stream: querySpacesRecord(
        queryBuilder: (spacesRecord) => spacesRecord.where(
          'name',
          isEqualTo: widget.name,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<SpacesRecord> spacesSpacesRecordList = snapshot.data!;
        final spacesSpacesRecord = spacesSpacesRecordList.isNotEmpty
            ? spacesSpacesRecordList.first
            : null;
        return Title(
            title: 'spaces',
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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 0.0),
                        child: wrapWithModel(
                          model: _model.threadsBarCopyModel,
                          updateCallback: () => setState(() {}),
                          child: Hero(
                            tag: 'spaces',
                            transitionOnUserGestures: true,
                            child: Material(
                              color: Colors.transparent,
                              child: ThreadsBarCopyWidget(
                                name: widget.name!,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                ))
                                  wrapWithModel(
                                    model: _model.pCNavBarModel,
                                    updateCallback: () => setState(() {}),
                                    child: PCNavBarWidget(
                                      currentPage: 1,
                                    ),
                                  ),
                                Flexible(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 200.0,
                                              decoration: BoxDecoration(),
                                            ),
                                            Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 5.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<ThreadRecord>>(
                                                    stream: queryThreadRecord(
                                                      queryBuilder: (threadRecord) =>
                                                          threadRecord
                                                              .whereIn(
                                                                  'thread.id',
                                                                  spacesSpacesRecord
                                                                      ?.threads)
                                                              .orderBy(
                                                                  'thread.timestamp',
                                                                  descending:
                                                                      true),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitRipple(
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
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: ThreadWidget(
                                                              key: Key(
                                                                  'Keymnw_${columnIndex}_of_${columnThreadRecordList.length}'),
                                                              thread:
                                                                  columnThreadRecord,
                                                              isComment: columnThreadRecord
                                                                      .thread
                                                                      .comments
                                                                      .length >
                                                                  2,
                                                              isCommentAllowed:
                                                                  false,
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'threadOnPageLoadAnimation1']!),
                                                          );
                                                        })
                                                            .divide(SizedBox(
                                                                height: 10.0))
                                                            .around(SizedBox(
                                                                height: 10.0)),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: StreamBuilder<List<ThreadRecord>>(
                                      stream: queryThreadRecord(
                                        queryBuilder: (threadRecord) =>
                                            threadRecord
                                                .whereIn(
                                                    'thread.id',
                                                    spacesSpacesRecord
                                                                ?.threads !=
                                                            ''
                                                        ? spacesSpacesRecord
                                                            ?.threads
                                                        : null)
                                                .orderBy('thread.timestamp',
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
                                                    FlutterFlowTheme.of(context)
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
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                                  columnThreadRecordList.length,
                                                  (columnIndex) {
                                            final columnThreadRecord =
                                                columnThreadRecordList[
                                                    columnIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: ThreadWidget(
                                                key: Key(
                                                    'Keys74_${columnIndex}_of_${columnThreadRecordList.length}'),
                                                thread: columnThreadRecord,
                                                isComment: false,
                                                isCommentAllowed: false,
                                              ).animateOnPageLoad(animationsMap[
                                                  'threadOnPageLoadAnimation2']!),
                                            );
                                          })
                                              .divide(SizedBox(height: 10.0))
                                              .around(SizedBox(height: 10.0)),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
