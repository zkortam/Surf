import '/backend/backend.dart';
import '/components/p_c_nav_bar_widget.dart';
import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Home',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  if (responsiveVisibility(
                    context: context,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (responsiveVisibility(
                            context: context,
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
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.75,
                                        height: 50.0,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '3ayzpskj' /* Home */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.white,
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                        icon: Icon(
                                          Icons.near_me,
                                          color: Colors.white,
                                          size: 15.0,
                                        ),
                                        onPressed: () async {
                                          context.pushNamed('chat_main');
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 0.0),
                            child: StreamBuilder<List<PostsRecord>>(
                              stream: queryPostsRecord(
                                queryBuilder: (postsRecord) =>
                                    postsRecord.orderBy('post.timestamp',
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
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<PostsRecord> columnPostsRecordList =
                                    snapshot.data!;
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(
                                      columnPostsRecordList.length,
                                      (columnIndex) {
                                    final columnPostsRecord =
                                        columnPostsRecordList[columnIndex];
                                    return PostWidget(
                                      key: Key(
                                          'Keyz7d_${columnIndex}_of_${columnPostsRecordList.length}'),
                                      post: columnPostsRecord,
                                      isComment: false,
                                    );
                                  }).divide(SizedBox(height: 10.0)),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                  ))
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
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
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (responsiveVisibility(
                                        context: context,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.75,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(),
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
                                                            '0oepkaiw' /* Home */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Colors
                                                                    .white,
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
                                                    icon: Icon(
                                                      Icons.near_me,
                                                      color: Colors.white,
                                                      size: 15.0,
                                                    ),
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                          'chat_main');
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 0.0),
                                        child: StreamBuilder<List<PostsRecord>>(
                                          stream: queryPostsRecord(
                                            queryBuilder: (postsRecord) =>
                                                postsRecord.orderBy(
                                                    'post.timestamp',
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<PostsRecord>
                                                columnPostsRecordList =
                                                snapshot.data!;
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: List.generate(
                                                  columnPostsRecordList.length,
                                                  (columnIndex) {
                                                final columnPostsRecord =
                                                    columnPostsRecordList[
                                                        columnIndex];
                                                return PostWidget(
                                                  key: Key(
                                                      'Key07v_${columnIndex}_of_${columnPostsRecordList.length}'),
                                                  post: columnPostsRecord,
                                                  isComment: _model.isComment,
                                                );
                                              }).divide(SizedBox(height: 10.0)),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Container(
                                    width: 50.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius:
                                          BorderRadius.circular(200.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: valueOrDefault<Color>(
                                              _model.isComment
                                                  ? Color(0xFF168323)
                                                  : Color(0xFFC91212),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              if (_model.isComment) {
                                                setState(() {
                                                  _model.isComment = false;
                                                });
                                              } else {
                                                setState(() {
                                                  _model.isComment = true;
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
                                              Icons.auto_awesome_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 22.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
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
                ],
              ),
            ),
          ),
        ));
  }
}
