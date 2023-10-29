import '/components/space_threads_nav_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'threads_bar_model.dart';
export 'threads_bar_model.dart';

class ThreadsBarWidget extends StatefulWidget {
  const ThreadsBarWidget({Key? key}) : super(key: key);

  @override
  _ThreadsBarWidgetState createState() => _ThreadsBarWidgetState();
}

class _ThreadsBarWidgetState extends State<ThreadsBarWidget> {
  late ThreadsBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThreadsBarModel());

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

    return Visibility(
      visible: responsiveVisibility(
        context: context,
        tabletLandscape: false,
        desktop: false,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
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
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlutterFlowIconButton(
                  borderColor: Colors.white,
                  borderRadius: 25.0,
                  borderWidth: 3.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.grain,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: SpaceThreadsNavWidget(),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.65,
                  height: 50.0,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'wz8mr5pb' /* Threads */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
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
                  icon: FaIcon(
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
    );
  }
}
