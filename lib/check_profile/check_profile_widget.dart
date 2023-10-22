import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'check_profile_model.dart';
export 'check_profile_model.dart';

class CheckProfileWidget extends StatefulWidget {
  const CheckProfileWidget({Key? key}) : super(key: key);

  @override
  _CheckProfileWidgetState createState() => _CheckProfileWidgetState();
}

class _CheckProfileWidgetState extends State<CheckProfileWidget> {
  late CheckProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((currentUserPhoto != null && currentUserPhoto != '') &&
          (valueOrDefault(currentUserDocument?.banner, '') != null &&
              valueOrDefault(currentUserDocument?.banner, '') != '') &&
          (valueOrDefault(currentUserDocument?.pincode, '') != null &&
              valueOrDefault(currentUserDocument?.pincode, '') != '') &&
          (valueOrDefault(currentUserDocument?.realName, '') != null &&
              valueOrDefault(currentUserDocument?.realName, '') != '') &&
          (valueOrDefault(currentUserDocument?.bio, '') != null &&
              valueOrDefault(currentUserDocument?.bio, '') != '')) {
        // Proceed

        context.goNamed('Home');
      } else {
        // Bad Profile

        context.pushNamed('createProfile');
      }
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
        title: 'CheckProfile',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Container(
              width: 610.0,
              height: 870.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primary,
                    FlutterFlowTheme.of(context).secondary
                  ],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      's8t5c4cd' /* Loading Page  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
