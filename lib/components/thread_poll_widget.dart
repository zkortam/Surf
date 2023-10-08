import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'thread_poll_model.dart';
export 'thread_poll_model.dart';

class ThreadPollWidget extends StatefulWidget {
  const ThreadPollWidget({
    Key? key,
    this.thrad,
  }) : super(key: key);

  final ThreadRecord? thrad;

  @override
  _ThreadPollWidgetState createState() => _ThreadPollWidgetState();
}

class _ThreadPollWidgetState extends State<ThreadPollWidget> {
  late ThreadPollModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThreadPollModel());

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
      width: 500.0,
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          if (!((functions.stringInArr(currentUserUid,
                      widget.thrad!.thread.poll.option1Voters.toList()) ==
                  false) &&
              (functions.stringInArr(currentUserUid,
                      widget.thrad!.thread.poll.option2Voters.toList()) ==
                  false) &&
              (functions.stringInArr(currentUserUid,
                      widget.thrad!.thread.poll.option3Voters.toList()) ==
                  false) &&
              (functions.stringInArr(currentUserUid,
                      widget.thrad!.thread.poll.option4Voters.toList()) ==
                  false)))
            Container(
              width: 500.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 55.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Stack(
                                children: [
                                  Stack(
                                    children: [
                                      if (responsiveVisibility(
                                        context: context,
                                        tablet: false,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        LinearPercentIndicator(
                                          percent: functions.pollDivider(
                                              widget.thrad!.thread.poll
                                                  .option1Voters.length,
                                              widget.thrad!.thread.poll
                                                  .totalVotes),
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.78,
                                          lineHeight: 50.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor: Color(0xFF558DD6),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          barRadius: Radius.circular(150.0),
                                          padding: EdgeInsets.zero,
                                        ),
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                      ))
                                        LinearPercentIndicator(
                                          percent: functions.pollDivider(
                                              widget.thrad!.thread.poll
                                                  .option1Voters.length,
                                              widget.thrad!.thread.poll
                                                  .totalVotes),
                                          width: 440.0,
                                          lineHeight: 50.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor: Color(0xFF558DD6),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          barRadius: Radius.circular(150.0),
                                          padding: EdgeInsets.zero,
                                        ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            widget
                                                .thrad!.thread.poll.options[0],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 15.0,
                                                ),
                                          ),
                                        ),
                                        if (functions.stringInArr(
                                                currentUserUid,
                                                widget.thrad!.thread.poll
                                                    .option1Voters
                                                    .toList()) ==
                                            true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 10.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons.check_circle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 24.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  7.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  functions.percentFinder(
                                      widget.thrad!.thread.poll.totalVotes,
                                      widget.thrad!.thread.poll.option1Voters
                                          .length),
                                  '0%',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 55.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: Stack(
                                children: [
                                  Stack(
                                    children: [
                                      if (responsiveVisibility(
                                        context: context,
                                        tablet: false,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        LinearPercentIndicator(
                                          percent: functions.pollDivider(
                                              widget.thrad!.thread.poll
                                                  .option2Voters.length,
                                              widget.thrad!.thread.poll
                                                  .totalVotes),
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.78,
                                          lineHeight: 50.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor: Color(0xFF558DD6),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          barRadius: Radius.circular(150.0),
                                          padding: EdgeInsets.zero,
                                        ),
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                      ))
                                        LinearPercentIndicator(
                                          percent: functions.pollDivider(
                                              widget.thrad!.thread.poll
                                                  .option2Voters.length,
                                              widget.thrad!.thread.poll
                                                  .totalVotes),
                                          width: 440.0,
                                          lineHeight: 50.0,
                                          animation: true,
                                          animateFromLastPercent: true,
                                          progressColor: Color(0xFF558DD6),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          barRadius: Radius.circular(100.0),
                                          padding: EdgeInsets.zero,
                                        ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 0.0, 0.0),
                                          child: Text(
                                            widget
                                                .thrad!.thread.poll.options[1],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  fontSize: 15.0,
                                                ),
                                          ),
                                        ),
                                        if (functions.stringInArr(
                                                currentUserUid,
                                                widget.thrad!.thread.poll
                                                    .option2Voters
                                                    .toList()) ==
                                            true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 10.0, 0.0, 0.0),
                                            child: Icon(
                                              Icons.check_circle,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              size: 24.0,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  7.0, 0.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  functions.percentFinder(
                                      widget.thrad!.thread.poll.totalVotes,
                                      widget.thrad!.thread.poll.option2Voters
                                          .length),
                                  '0%',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 16.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (widget.thrad!.thread.poll.options.length >= 3)
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 55.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Stack(
                                  children: [
                                    Stack(
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                        ))
                                          LinearPercentIndicator(
                                            percent: functions.pollDivider(
                                                widget.thrad!.thread.poll
                                                    .option3Voters.length,
                                                widget.thrad!.thread.poll
                                                    .totalVotes),
                                            width: 440.0,
                                            lineHeight: 50.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: Color(0xFF558DD6),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            barRadius: Radius.circular(150.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          LinearPercentIndicator(
                                            percent: functions.pollDivider(
                                                widget.thrad!.thread.poll
                                                    .option3Voters.length,
                                                widget.thrad!.thread.poll
                                                    .totalVotes),
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.78,
                                            lineHeight: 50.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: Color(0xFF558DD6),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            barRadius: Radius.circular(150.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget.thrad?.thread?.poll
                                                    ?.options?[2],
                                                'None',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        fontSize: 15.0,
                                                      ),
                                            ),
                                          ),
                                          if (functions.stringInArr(
                                                  currentUserUid,
                                                  widget.thrad!.thread.poll
                                                      .option2Voters
                                                      .toList()) ==
                                              true)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 10.0, 0.0, 0.0),
                                              child: Icon(
                                                Icons.check_circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                size: 24.0,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    7.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    functions.percentFinder(
                                        widget.thrad!.thread.poll.totalVotes,
                                        widget.thrad!.thread.poll.option3Voters
                                            .length),
                                    '0%',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 16.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (widget.thrad?.thread?.poll?.options?.length == 4)
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 55.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Stack(
                                  children: [
                                    Stack(
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                        ))
                                          LinearPercentIndicator(
                                            percent: functions.pollDivider(
                                                widget.thrad!.thread.poll
                                                    .option4Voters.length,
                                                widget.thrad!.thread.poll
                                                    .totalVotes),
                                            width: 440.0,
                                            lineHeight: 50.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: Color(0xFF558DD6),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            barRadius: Radius.circular(100.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        if (responsiveVisibility(
                                          context: context,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          LinearPercentIndicator(
                                            percent: functions.pollDivider(
                                                widget.thrad!.thread.poll
                                                    .option4Voters.length,
                                                widget.thrad!.thread.poll
                                                    .totalVotes),
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.78,
                                            lineHeight: 50.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: Color(0xFF558DD6),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            barRadius: Radius.circular(100.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget.thrad?.thread?.poll
                                                    ?.options?[3],
                                                'None',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        fontSize: 15.0,
                                                      ),
                                            ),
                                          ),
                                          if (functions.stringInArr(
                                                  currentUserUid,
                                                  widget.thrad!.thread.poll
                                                      .option2Voters
                                                      .toList()) ==
                                              true)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 10.0, 0.0, 0.0),
                                              child: Icon(
                                                Icons.check_circle,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                size: 24.0,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    7.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    functions.percentFinder(
                                        widget.thrad!.thread.poll.totalVotes,
                                        widget.thrad!.thread.poll.option4Voters
                                            .length),
                                    '0%',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 16.0,
                                      ),
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
          if ((functions.stringInArr(currentUserUid,
                      widget.thrad!.thread.poll.option1Voters.toList()) ==
                  false) &&
              (functions.stringInArr(currentUserUid,
                      widget.thrad!.thread.poll.option2Voters.toList()) ==
                  false) &&
              (functions.stringInArr(currentUserUid,
                      widget.thrad!.thread.poll.option3Voters.toList()) ==
                  false) &&
              (functions.stringInArr(currentUserUid,
                      widget.thrad!.thread.poll.option4Voters.toList()) ==
                  false))
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await widget.thrad!.reference
                                    .update(createThreadRecordData(
                                  thread: createThreadStruct(
                                    poll: createPollStruct(
                                      fieldValues: {
                                        'totalVotes': FieldValue.increment(1),
                                        'option1Voters': FieldValue.arrayUnion(
                                            [currentUserUid]),
                                      },
                                      clearUnsetFields: false,
                                    ),
                                    clearUnsetFields: false,
                                  ),
                                ));
                              },
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        widget.thrad?.thread?.poll?.options
                                            ?.first,
                                        'None',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await widget.thrad!.reference
                                    .update(createThreadRecordData(
                                  thread: createThreadStruct(
                                    poll: createPollStruct(
                                      fieldValues: {
                                        'totalVotes': FieldValue.increment(1),
                                        'option2Voters': FieldValue.arrayUnion(
                                            [currentUserUid]),
                                      },
                                      clearUnsetFields: false,
                                    ),
                                    clearUnsetFields: false,
                                  ),
                                ));
                              },
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        widget.thrad?.thread?.poll?.options?[1],
                                        'None',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (widget.thrad!.thread.poll.options.length >= 3)
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 5.0, 5.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await widget.thrad!.reference
                                      .update(createThreadRecordData(
                                    thread: createThreadStruct(
                                      poll: createPollStruct(
                                        fieldValues: {
                                          'totalVotes': FieldValue.increment(1),
                                          'option3Voters':
                                              FieldValue.arrayUnion(
                                                  [currentUserUid]),
                                        },
                                        clearUnsetFields: false,
                                      ),
                                      clearUnsetFields: false,
                                    ),
                                  ));
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          widget
                                              .thrad?.thread?.poll?.options?[2],
                                          'None',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        if (widget.thrad?.thread?.poll?.options?.length == 4)
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 5.0, 5.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await widget.thrad!.reference
                                      .update(createThreadRecordData(
                                    thread: createThreadStruct(
                                      poll: createPollStruct(
                                        fieldValues: {
                                          'totalVotes': FieldValue.increment(1),
                                          'option4Voters':
                                              FieldValue.arrayUnion(
                                                  [currentUserUid]),
                                        },
                                        clearUnsetFields: false,
                                      ),
                                      clearUnsetFields: false,
                                    ),
                                  ));
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          widget
                                              .thrad?.thread?.poll?.options?[3],
                                          'None',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500,
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
              ),
            ),
        ],
      ),
    );
  }
}
