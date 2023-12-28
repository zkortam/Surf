import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'follower_card_model.dart';
export 'follower_card_model.dart';

class FollowerCardWidget extends StatefulWidget {
  const FollowerCardWidget({
    super.key,
    required this.user,
    required this.id,
  });

  final UsersRecord? user;
  final String? id;

  @override
  _FollowerCardWidgetState createState() => _FollowerCardWidgetState();
}

class _FollowerCardWidgetState extends State<FollowerCardWidget> {
  late FollowerCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FollowerCardModel());

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

    return Container(
      width: double.infinity,
      height: 55.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FutureBuilder<List<UsersRecord>>(
            future: queryUsersRecordOnce(
              queryBuilder: (usersRecord) => usersRecord.where(
                'uid',
                isEqualTo: widget.user?.uid,
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
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 50.0,
                    ),
                  ),
                );
              }
              List<UsersRecord> rowUsersRecordList = snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final rowUsersRecord = rowUsersRecordList.isNotEmpty
                  ? rowUsersRecordList.first
                  : null;
              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(
                    'Profile',
                    queryParameters: {
                      'userID': serializeParam(
                        rowUsersRecord?.uid,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                      ),
                    },
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: 45.0,
                        height: 45.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          widget.user!.photoUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.user!.realName,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 15.0,
                                ),
                          ),
                          Text(
                            '@${widget.user?.displayName}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 14.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if ((functions.stringInArr(
                          widget.user!.uid,
                          (currentUserDocument?.following.toList() ?? [])
                              .toList()) ==
                      false) &&
                  (currentUserUid != widget.user?.uid))
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => FlutterFlowIconButton(
                      borderRadius: 20.0,
                      borderWidth: 0.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      icon: const Icon(
                        Icons.person_add,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      onPressed: () async {
                        await widget.user!.reference.update({
                          ...mapToFirestore(
                            {
                              'followers':
                                  FieldValue.arrayUnion([currentUserUid]),
                            },
                          ),
                        });

                        await currentUserReference!.update({
                          ...mapToFirestore(
                            {
                              'following':
                                  FieldValue.arrayUnion([widget.user?.uid]),
                            },
                          ),
                        });
                      },
                    ),
                  ),
                ),
              if (currentUserUid == widget.id)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'followers':
                                FieldValue.arrayRemove([widget.user?.uid]),
                          },
                        ),
                      });

                      await widget.user!.reference.update({
                        ...mapToFirestore(
                          {
                            'following':
                                FieldValue.arrayRemove([currentUserUid]),
                          },
                        ),
                      });
                    },
                    text: FFLocalizations.of(context).getText(
                      'vqmpcjwj' /* Remove */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryText,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Outfit',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
