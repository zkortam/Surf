import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/edit_post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_comp_model.dart';
export 'home_comp_model.dart';

class HomeCompWidget extends StatefulWidget {
  const HomeCompWidget({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostsRecord? post;

  @override
  _HomeCompWidgetState createState() => _HomeCompWidgetState();
}

class _HomeCompWidgetState extends State<HomeCompWidget> {
  late HomeCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeCompModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Stack(
        children: [
          if (responsiveVisibility(
            context: context,
            phone: false,
            tablet: false,
          ))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(35.0, 0.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.00, 1.00),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Stack(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 10.0),
                              child: Container(
                                width: 600.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 5.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFF0F66E2),
                                              Color(0xFF541BE3)
                                            ],
                                            stops: [0.0, 1.0],
                                            begin:
                                                AlignmentDirectional(1.0, 0.0),
                                            end: AlignmentDirectional(-1.0, 0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(6.0, 0.0, 0.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.white,
                                                borderRadius: 20.0,
                                                borderWidth: 3.0,
                                                buttonSize: 30.0,
                                                icon: Icon(
                                                  Icons.arrow_back_rounded,
                                                  color: Colors.white,
                                                  size: 15.0,
                                                ),
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, 0.00),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  40.0,
                                                                  0.0),
                                                      child: FutureBuilder<
                                                          List<UsersRecord>>(
                                                        future:
                                                            queryUsersRecordOnce(
                                                          queryBuilder:
                                                              (usersRecord) =>
                                                                  usersRecord
                                                                      .where(
                                                            'uid',
                                                            isEqualTo: widget
                                                                .post
                                                                ?.post
                                                                ?.author,
                                                          ),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    SpinKitRipple(
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
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final textUsersRecord =
                                                              textUsersRecordList
                                                                      .isNotEmpty
                                                                  ? textUsersRecordList
                                                                      .first
                                                                  : null;
                                                          return Text(
                                                            '@${widget.post!.post.isStealth ? 'anonymous' : textUsersRecord?.displayName}\'s Post',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      15.0,
                                                                ),
                                                          );
                                                        },
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
                                    Container(
                                      width: 600.0,
                                      height: 55.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 10.0, 0.0, 0.0),
                                              child: FutureBuilder<
                                                  List<UsersRecord>>(
                                                future: queryUsersRecordOnce(
                                                  queryBuilder: (usersRecord) =>
                                                      usersRecord.where(
                                                    'uid',
                                                    isEqualTo: widget
                                                        .post?.post?.author,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<UsersRecord>
                                                      containerUsersRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final containerUsersRecord =
                                                      containerUsersRecordList
                                                              .isNotEmpty
                                                          ? containerUsersRecordList
                                                              .first
                                                          : null;
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
                                                      context.pushNamed(
                                                        'singlePost',
                                                        queryParameters: {
                                                          'posts':
                                                              serializeParam(
                                                            widget.post,
                                                            ParamType.Document,
                                                          ),
                                                          'action':
                                                              serializeParam(
                                                            1,
                                                            ParamType.int,
                                                          ),
                                                          'username':
                                                              serializeParam(
                                                            containerUsersRecord
                                                                ?.displayName,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'posts': widget.post,
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .import_export,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 25.0,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.00, 0.00),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '7bgedjs1' /* Share */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        18.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 10.0, 5.0, 0.0),
                                              child: FutureBuilder<
                                                  List<UsersRecord>>(
                                                future: queryUsersRecordOnce(
                                                  queryBuilder: (usersRecord) =>
                                                      usersRecord.where(
                                                    'uid',
                                                    isEqualTo: widget
                                                        .post?.post?.author,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<UsersRecord>
                                                      containerUsersRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final containerUsersRecord =
                                                      containerUsersRecordList
                                                              .isNotEmpty
                                                          ? containerUsersRecordList
                                                              .first
                                                          : null;
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
                                                      context.pushNamed(
                                                        'singlePost',
                                                        queryParameters: {
                                                          'posts':
                                                              serializeParam(
                                                            widget.post,
                                                            ParamType.Document,
                                                          ),
                                                          'action':
                                                              serializeParam(
                                                            2,
                                                            ParamType.int,
                                                          ),
                                                          'username':
                                                              serializeParam(
                                                            containerUsersRecord
                                                                ?.displayName,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                        extra: <String,
                                                            dynamic>{
                                                          'posts': widget.post,
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .content_copy_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.00, 0.00),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '1k19ih3r' /* Copy Link */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        17.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (currentUserUid ==
                                        widget.post?.post?.author)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 10.0, 5.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            Navigator.pop(context);
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: EditPostWidget(
                                                    post: widget.post!,
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.edit,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 23.0,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'g03s42gf' /* Edit Post */,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 17.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 5.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await currentUserReference!.update({
                                            ...mapToFirestore(
                                              {
                                                'saved': FieldValue.arrayUnion(
                                                    [widget.post?.post?.id]),
                                              },
                                            ),
                                          });
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Icon(
                                                  Icons.bookmark,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 21.0,
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mup5ncbl' /* Save to Library */,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 17.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (currentUserUid !=
                                        widget.post?.post?.author)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 10.0, 5.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE1343E),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await launchURL(
                                                  'surmedia.org/report');
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'cblkvsk3' /* Report */,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontSize: 17.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (currentUserUid ==
                                        widget.post?.post?.author)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 10.0, 5.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE1343E),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final firestoreBatch =
                                                  FirebaseFirestore.instance
                                                      .batch();
                                              try {
                                                firestoreBatch.delete(
                                                    widget.post!.reference);

                                                firestoreBatch.update(
                                                    currentUserReference!, {
                                                  ...mapToFirestore(
                                                    {
                                                      'Posts': FieldValue
                                                          .arrayRemove([
                                                        getPostFirestoreData(
                                                          updatePostStruct(
                                                            widget.post?.post,
                                                            clearUnsetFields:
                                                                false,
                                                          ),
                                                          true,
                                                        )
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              } finally {
                                                await firestoreBatch.commit();
                                              }
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'kt1r209i' /* Delete */,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontSize: 17.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (valueOrDefault<bool>(
                                        currentUserDocument?.admin, false))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 10.0, 5.0, 5.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Container(
                                            width: 190.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                  Color(0xFF3999D2)
                                                ],
                                                stops: [0.0, 1.0],
                                                begin: AlignmentDirectional(
                                                    1.0, 0.0),
                                                end: AlignmentDirectional(
                                                    -1.0, 0),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(300.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 0.0,
                                                                0.0, 0.0),
                                                    child: StreamBuilder<
                                                        List<UsersRecord>>(
                                                      stream: queryUsersRecord(
                                                        queryBuilder:
                                                            (usersRecord) =>
                                                                usersRecord
                                                                    .where(
                                                          'uid',
                                                          isEqualTo: widget.post
                                                              ?.post?.author,
                                                        ),
                                                        singleRecord: true,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<UsersRecord>
                                                            iconButtonUsersRecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final iconButtonUsersRecord =
                                                            iconButtonUsersRecordList
                                                                    .isNotEmpty
                                                                ? iconButtonUsersRecordList
                                                                    .first
                                                                : null;
                                                        return FlutterFlowIconButton(
                                                          borderColor:
                                                              Colors.white,
                                                          borderRadius: 30.0,
                                                          borderWidth: 3.0,
                                                          buttonSize: 40.0,
                                                          icon: Icon(
                                                            Icons.delete,
                                                            color: Colors.white,
                                                            size: 20.0,
                                                          ),
                                                          onPressed: () async {
                                                            final firestoreBatch =
                                                                FirebaseFirestore
                                                                    .instance
                                                                    .batch();
                                                            try {
                                                              firestoreBatch
                                                                  .delete(widget
                                                                      .post!
                                                                      .reference);

                                                              firestoreBatch.update(
                                                                  iconButtonUsersRecord!
                                                                      .reference,
                                                                  {
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'Posts':
                                                                            FieldValue.arrayRemove([
                                                                          getPostFirestoreData(
                                                                            updatePostStruct(
                                                                              widget.post?.post,
                                                                              clearUnsetFields: false,
                                                                            ),
                                                                            true,
                                                                          )
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                            } finally {
                                                              await firestoreBatch
                                                                  .commit();
                                                            }
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child: StreamBuilder<
                                                        List<UsersRecord>>(
                                                      stream: queryUsersRecord(
                                                        queryBuilder:
                                                            (usersRecord) =>
                                                                usersRecord
                                                                    .where(
                                                          'uid',
                                                          isEqualTo: widget.post
                                                              ?.post?.author,
                                                        ),
                                                        singleRecord: true,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<UsersRecord>
                                                            iconButtonUsersRecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final iconButtonUsersRecord =
                                                            iconButtonUsersRecordList
                                                                    .isNotEmpty
                                                                ? iconButtonUsersRecordList
                                                                    .first
                                                                : null;
                                                        return FlutterFlowIconButton(
                                                          borderColor:
                                                              Colors.white,
                                                          borderRadius: 30.0,
                                                          borderWidth: 3.0,
                                                          buttonSize: 40.0,
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .hammer,
                                                            color: Colors.white,
                                                            size: 15.0,
                                                          ),
                                                          onPressed: () async {
                                                            await authManager
                                                                .deleteUser(
                                                                    context);

                                                            context.goNamedAuth(
                                                                'Home',
                                                                context
                                                                    .mounted);
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                0.0, 0.0),
                                                    child: StreamBuilder<
                                                        List<UsersRecord>>(
                                                      stream: queryUsersRecord(
                                                        queryBuilder:
                                                            (usersRecord) =>
                                                                usersRecord
                                                                    .where(
                                                          'uid',
                                                          isEqualTo: widget.post
                                                              ?.post?.author,
                                                        ),
                                                        singleRecord: true,
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<UsersRecord>
                                                            iconButtonUsersRecordList =
                                                            snapshot.data!;
                                                        // Return an empty Container when the item does not exist.
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final iconButtonUsersRecord =
                                                            iconButtonUsersRecordList
                                                                    .isNotEmpty
                                                                ? iconButtonUsersRecordList
                                                                    .first
                                                                : null;
                                                        return FlutterFlowIconButton(
                                                          borderColor:
                                                              Colors.white,
                                                          borderRadius: 30.0,
                                                          borderWidth: 3.0,
                                                          buttonSize: 40.0,
                                                          icon: Icon(
                                                            Icons.arrow_forward,
                                                            color: Colors.white,
                                                            size: 20.0,
                                                          ),
                                                          onPressed: () async {
                                                            context.pushNamed(
                                                              'Profile',
                                                              queryParameters: {
                                                                'userID':
                                                                    serializeParam(
                                                                  widget
                                                                      .post
                                                                      ?.post
                                                                      ?.author,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                        );
                                                      },
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (responsiveVisibility(
            context: context,
            tabletLandscape: false,
            desktop: false,
          ))
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.pop(context);
              },
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.00, 1.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 10.0),
                            child: Container(
                              width: 600.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 10.0, 5.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xFF0F66E2),
                                            Color(0xFF541BE3)
                                          ],
                                          stops: [0.0, 1.0],
                                          begin: AlignmentDirectional(1.0, 0.0),
                                          end: AlignmentDirectional(-1.0, 0),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 0.0, 0.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.white,
                                              borderRadius: 20.0,
                                              borderWidth: 3.0,
                                              buttonSize: 30.0,
                                              icon: Icon(
                                                Icons.arrow_back_rounded,
                                                color: Colors.white,
                                                size: 15.0,
                                              ),
                                              onPressed: () async {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                40.0, 0.0),
                                                    child: FutureBuilder<
                                                        List<UsersRecord>>(
                                                      future:
                                                          queryUsersRecordOnce(
                                                        queryBuilder:
                                                            (usersRecord) =>
                                                                usersRecord
                                                                    .where(
                                                          'uid',
                                                          isEqualTo: widget.post
                                                              ?.post?.author,
                                                        ),
                                                        singleRecord: true,
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
                                                        if (snapshot
                                                            .data!.isEmpty) {
                                                          return Container();
                                                        }
                                                        final textUsersRecord =
                                                            textUsersRecordList
                                                                    .isNotEmpty
                                                                ? textUsersRecordList
                                                                    .first
                                                                : null;
                                                        return Text(
                                                          '@${widget.post!.post.isStealth ? 'anonymous' : textUsersRecord?.displayName}\'s Post',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 15.0,
                                                              ),
                                                        );
                                                      },
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
                                  Container(
                                    width: 600.0,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 10.0, 0.0, 0.0),
                                            child: FutureBuilder<
                                                List<UsersRecord>>(
                                              future: queryUsersRecordOnce(
                                                queryBuilder: (usersRecord) =>
                                                    usersRecord.where(
                                                  'uid',
                                                  isEqualTo:
                                                      widget.post?.post?.author,
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
                                                    containerUsersRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final containerUsersRecord =
                                                    containerUsersRecordList
                                                            .isNotEmpty
                                                        ? containerUsersRecordList
                                                            .first
                                                        : null;
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
                                                    context.pushNamed(
                                                      'singlePost',
                                                      queryParameters: {
                                                        'posts': serializeParam(
                                                          widget.post,
                                                          ParamType.Document,
                                                        ),
                                                        'action':
                                                            serializeParam(
                                                          1,
                                                          ParamType.int,
                                                        ),
                                                        'username':
                                                            serializeParam(
                                                          containerUsersRecord
                                                              ?.displayName,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'posts': widget.post,
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.import_export,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 25.0,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              't3pgw1om' /* Share */,
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      18.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 10.0, 5.0, 0.0),
                                            child: FutureBuilder<
                                                List<UsersRecord>>(
                                              future: queryUsersRecordOnce(
                                                queryBuilder: (usersRecord) =>
                                                    usersRecord.where(
                                                  'uid',
                                                  isEqualTo:
                                                      widget.post?.post?.author,
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
                                                    containerUsersRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final containerUsersRecord =
                                                    containerUsersRecordList
                                                            .isNotEmpty
                                                        ? containerUsersRecordList
                                                            .first
                                                        : null;
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
                                                    context.pushNamed(
                                                      'singlePost',
                                                      queryParameters: {
                                                        'posts': serializeParam(
                                                          widget.post,
                                                          ParamType.Document,
                                                        ),
                                                        'action':
                                                            serializeParam(
                                                          2,
                                                          ParamType.int,
                                                        ),
                                                        'username':
                                                            serializeParam(
                                                          containerUsersRecord
                                                              ?.displayName,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'posts': widget.post,
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .content_copy_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'mtw8a7de' /* Copy Link */,
                                                            ),
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      17.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (currentUserUid ==
                                      widget.post?.post?.author)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 5.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          Navigator.pop(context);
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: EditPostWidget(
                                                  post: widget.post!,
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.edit,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 23.0,
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '0tvdfh0f' /* Edit Post */,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 17.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 10.0, 5.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await currentUserReference!.update({
                                          ...mapToFirestore(
                                            {
                                              'saved': FieldValue.arrayUnion(
                                                  [widget.post?.post?.id]),
                                            },
                                          ),
                                        });
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 10.0, 0.0),
                                              child: Icon(
                                                Icons.bookmark,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 21.0,
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'p2y9q35c' /* Save to Library */,
                                                ),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 17.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (currentUserUid !=
                                      widget.post?.post?.author)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 5.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE1343E),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await launchURL(
                                                'surmedia.org/report');
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '7lbbb6lr' /* Report */,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.white,
                                                        fontSize: 17.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (currentUserUid ==
                                      widget.post?.post?.author)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 5.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE1343E),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final firestoreBatch =
                                                FirebaseFirestore.instance
                                                    .batch();
                                            try {
                                              firestoreBatch.delete(
                                                  widget.post!.reference);

                                              firestoreBatch.update(
                                                  currentUserReference!, {
                                                ...mapToFirestore(
                                                  {
                                                    'Posts':
                                                        FieldValue.arrayRemove([
                                                      getPostFirestoreData(
                                                        updatePostStruct(
                                                          widget.post?.post,
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                        true,
                                                      )
                                                    ]),
                                                  },
                                                ),
                                              });
                                            } finally {
                                              await firestoreBatch.commit();
                                            }
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'dsis5dku' /* Delete */,
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.white,
                                                        fontSize: 17.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (valueOrDefault<bool>(
                                      currentUserDocument?.admin, false))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 5.0, 5.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          width: 190.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                Color(0xFF3999D2)
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                  1.0, 0.0),
                                              end:
                                                  AlignmentDirectional(-1.0, 0),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(300.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 0.0, 0.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<UsersRecord>>(
                                                    stream: queryUsersRecord(
                                                      queryBuilder:
                                                          (usersRecord) =>
                                                              usersRecord.where(
                                                        'uid',
                                                        isEqualTo: widget
                                                            .post?.post?.author,
                                                      ),
                                                      singleRecord: true,
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
                                                      List<UsersRecord>
                                                          iconButtonUsersRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final iconButtonUsersRecord =
                                                          iconButtonUsersRecordList
                                                                  .isNotEmpty
                                                              ? iconButtonUsersRecordList
                                                                  .first
                                                              : null;
                                                      return FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.white,
                                                        borderRadius: 30.0,
                                                        borderWidth: 3.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons.delete,
                                                          color: Colors.white,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          final firestoreBatch =
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .batch();
                                                          try {
                                                            firestoreBatch
                                                                .delete(widget
                                                                    .post!
                                                                    .reference);

                                                            firestoreBatch.update(
                                                                iconButtonUsersRecord!
                                                                    .reference,
                                                                {
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'Posts':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        getPostFirestoreData(
                                                                          updatePostStruct(
                                                                            widget.post?.post,
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                          true,
                                                                        )
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                          } finally {
                                                            await firestoreBatch
                                                                .commit();
                                                          }
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<UsersRecord>>(
                                                    stream: queryUsersRecord(
                                                      queryBuilder:
                                                          (usersRecord) =>
                                                              usersRecord.where(
                                                        'uid',
                                                        isEqualTo: widget
                                                            .post?.post?.author,
                                                      ),
                                                      singleRecord: true,
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
                                                      List<UsersRecord>
                                                          iconButtonUsersRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final iconButtonUsersRecord =
                                                          iconButtonUsersRecordList
                                                                  .isNotEmpty
                                                              ? iconButtonUsersRecordList
                                                                  .first
                                                              : null;
                                                      return FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.white,
                                                        borderRadius: 30.0,
                                                        borderWidth: 3.0,
                                                        buttonSize: 40.0,
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .hammer,
                                                          color: Colors.white,
                                                          size: 15.0,
                                                        ),
                                                        onPressed: () async {
                                                          await authManager
                                                              .deleteUser(
                                                                  context);

                                                          context.goNamedAuth(
                                                              'Home',
                                                              context.mounted);
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<UsersRecord>>(
                                                    stream: queryUsersRecord(
                                                      queryBuilder:
                                                          (usersRecord) =>
                                                              usersRecord.where(
                                                        'uid',
                                                        isEqualTo: widget
                                                            .post?.post?.author,
                                                      ),
                                                      singleRecord: true,
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
                                                      List<UsersRecord>
                                                          iconButtonUsersRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final iconButtonUsersRecord =
                                                          iconButtonUsersRecordList
                                                                  .isNotEmpty
                                                              ? iconButtonUsersRecordList
                                                                  .first
                                                              : null;
                                                      return FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.white,
                                                        borderRadius: 30.0,
                                                        borderWidth: 3.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons.arrow_forward,
                                                          color: Colors.white,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                            'Profile',
                                                            queryParameters: {
                                                              'userID':
                                                                  serializeParam(
                                                                widget
                                                                    .post
                                                                    ?.post
                                                                    ?.author,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                      );
                                                    },
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
