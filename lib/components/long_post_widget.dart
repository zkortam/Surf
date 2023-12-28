import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'long_post_model.dart';
export 'long_post_model.dart';

class LongPostWidget extends StatefulWidget {
  const LongPostWidget({super.key});

  @override
  _LongPostWidgetState createState() => _LongPostWidgetState();
}

class _LongPostWidgetState extends State<LongPostWidget> {
  late LongPostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LongPostModel());

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
      height: 700.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: const FlutterFlowVideoPlayer(
        path:
            'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
        videoType: VideoType.network,
        width: 400.0,
        height: 700.0,
        autoPlay: true,
        looping: true,
        showControls: true,
        allowFullScreen: false,
        allowPlaybackSpeedMenu: false,
      ),
    );
  }
}
