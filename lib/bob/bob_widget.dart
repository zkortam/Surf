import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bob_model.dart';
export 'bob_model.dart';

class BobWidget extends StatefulWidget {
  const BobWidget({Key? key}) : super(key: key);

  @override
  _BobWidgetState createState() => _BobWidgetState();
}

class _BobWidgetState extends State<BobWidget> {
  late BobModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BobModel());

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
        title: 'bob',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/eff67384-0465-40db-be93-ab67906280f7/dg24ub4-d9e57923-49e4-4ce5-9772-d9e9aff15291.png/v1/fill/w_596,h_511/bob_the_tomato_seemed_angry__by_samsather2_dg24ub4-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NTExIiwicGF0aCI6IlwvZlwvZWZmNjczODQtMDQ2NS00MGRiLWJlOTMtYWI2NzkwNjI4MGY3XC9kZzI0dWI0LWQ5ZTU3OTIzLTQ5ZTQtNGNlNS05NzcyLWQ5ZTlhZmYxNTI5MS5wbmciLCJ3aWR0aCI6Ijw9NTk2In1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.yHtt5nqGujWUFxGHWq5PL_2QYr_GmgG1BKkWcx3mTso',
                width: 1594.0,
                height: 1026.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ));
  }
}
