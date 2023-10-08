import '/backend/backend.dart';
import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scroll_post_model.dart';
export 'scroll_post_model.dart';

class ScrollPostWidget extends StatefulWidget {
  const ScrollPostWidget({
    Key? key,
    required this.uid,
    required this.post,
  }) : super(key: key);

  final String? uid;
  final PostsRecord? post;

  @override
  _ScrollPostWidgetState createState() => _ScrollPostWidgetState();
}

class _ScrollPostWidgetState extends State<ScrollPostWidget> {
  late ScrollPostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScrollPostModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.listViewController?.animateTo(
        _model.listViewController!.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'scrollPost',
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
                  SingleChildScrollView(
                    controller: _model.columnController,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 0.0),
                          child: StreamBuilder<List<PostsRecord>>(
                            stream: queryPostsRecord(
                              queryBuilder: (postsRecord) => postsRecord
                                  .where(
                                    'post.author',
                                    isEqualTo: widget.uid,
                                  )
                                  .where(
                                    'post.timestamp',
                                    isLessThan: widget.post?.post?.timestamp,
                                  )
                                  .where(
                                    'post.isStealth',
                                    isEqualTo: false,
                                  )
                                  .orderBy('post.timestamp'),
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
                              List<PostsRecord> columnPostsRecordList =
                                  snapshot.data!;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(columnPostsRecordList.length,
                                        (columnIndex) {
                                  final columnPostsRecord =
                                      columnPostsRecordList[columnIndex];
                                  return PostWidget(
                                    key: Key(
                                        'Keyw4v_${columnIndex}_of_${columnPostsRecordList.length}'),
                                    post: columnPostsRecord,
                                    isComment: false,
                                  );
                                }).divide(SizedBox(height: 10.0)),
                              );
                            },
                          ),
                        ),
                        ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: wrapWithModel(
                                model: _model.postModel2,
                                updateCallback: () => setState(() {}),
                                child: PostWidget(
                                  post: widget.post!,
                                ),
                              ),
                            ),
                          ],
                          controller: _model.listViewController,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 5.0, 10.0, 0.0),
                          child: StreamBuilder<List<PostsRecord>>(
                            stream: queryPostsRecord(
                              queryBuilder: (postsRecord) => postsRecord
                                  .where(
                                    'post.author',
                                    isEqualTo: widget.uid,
                                  )
                                  .where(
                                    'post.timestamp',
                                    isGreaterThan: widget.post?.post?.timestamp,
                                  )
                                  .where(
                                    'post.isStealth',
                                    isEqualTo: false,
                                  )
                                  .orderBy('post.timestamp', descending: true),
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
                              List<PostsRecord> columnPostsRecordList =
                                  snapshot.data!;
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children:
                                    List.generate(columnPostsRecordList.length,
                                            (columnIndex) {
                                  final columnPostsRecord =
                                      columnPostsRecordList[columnIndex];
                                  return PostWidget(
                                    key: Key(
                                        'Keyrd7_${columnIndex}_of_${columnPostsRecordList.length}'),
                                    post: columnPostsRecord,
                                    isComment: false,
                                  );
                                })
                                        .divide(SizedBox(height: 10.0))
                                        .addToStart(SizedBox(height: 0.0)),
                              );
                            },
                          ),
                        ),
                      ].divide(SizedBox(height: 10.0)),
                    ),
                  ),
                  if (responsiveVisibility(
                    context: context,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(200.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF9F1CFA), Color(0xFF0D28A2)],
                              stops: [0.0, 1.0],
                              begin: AlignmentDirectional(0.87, -1.0),
                              end: AlignmentDirectional(-0.87, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(200.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 5.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                      MediaQuery.sizeOf(context).width * 0.75,
                                  height: 50.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where(
                                            'uid',
                                            isEqualTo: widget.uid,
                                          ),
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitRipple(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<UsersRecord>
                                              textUsersRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final textUsersRecord =
                                              textUsersRecordList.isNotEmpty
                                                  ? textUsersRecordList.first
                                                  : null;
                                          return Text(
                                            '@${textUsersRecord?.displayName}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.white,
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
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
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
