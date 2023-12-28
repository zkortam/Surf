import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'p_c_comment_dark_model.dart';
export 'p_c_comment_dark_model.dart';

class PCCommentDarkWidget extends StatefulWidget {
  const PCCommentDarkWidget({
    super.key,
    required this.comment,
  });

  final CommentStruct? comment;

  @override
  _PCCommentDarkWidgetState createState() => _PCCommentDarkWidgetState();
}

class _PCCommentDarkWidgetState extends State<PCCommentDarkWidget> {
  late PCCommentDarkModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PCCommentDarkModel());

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

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        width: 500.0,
        constraints: const BoxConstraints(
          minHeight: 60.0,
          maxHeight: 450.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                      child: StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(
                          queryBuilder: (usersRecord) => usersRecord.where(
                            'uid',
                            isEqualTo: widget.comment?.authorid,
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
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<UsersRecord> rowUsersRecordList = snapshot.data!;
                          final rowUsersRecord = rowUsersRecordList.isNotEmpty
                              ? rowUsersRecordList.first
                              : null;
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
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
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 25.0,
                                        height: 25.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            widget.comment!.isStealth
                                                ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/surf-1-0-7-65fnd5/assets/9cs0t43k77pp/agents.png'
                                                : rowUsersRecord?.photoUrl,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/surf-1-0-7-65fnd5/assets/9cs0t43k77pp/agents.png',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              '@${widget.comment!.isStealth ? 'Anonymous' : rowUsersRecord?.displayName}',
                                              'anonymous',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 12.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Stack(
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                  ))
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            7.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          dateTimeFormat(
                                            'M/d h:mm a',
                                            widget.comment!.timestamp!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 12.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    if (widget.comment?.text != null &&
                        widget.comment?.text != '')
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    7.0, 2.0, 0.0, 0.0),
                                child: SelectionArea(
                                    child: AutoSizeText(
                                  widget.comment!.text
                                      .maybeHandleOverflow(maxChars: 400),
                                  maxLines: 5,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 13.0,
                                      ),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (widget.comment?.imageHash.image != null &&
                        widget.comment?.imageHash.image != '')
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 300.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Visibility(
                            visible: widget.comment?.imageHash.image != null &&
                                widget.comment?.imageHash.image != '',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: OctoImage(
                                placeholderBuilder: OctoPlaceholder.blurHash(
                                  widget.comment!.imageHash.blurHash,
                                ),
                                image: NetworkImage(
                                  widget.comment!.imageHash.image,
                                ),
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.cover,
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
    );
  }
}
