import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          child: Center(
            child: Image.asset(
              'assets/images/image_(2).png',
              width: 100.0,
              height: 100.0,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'entry': ParameterData.none(),
  'signUp': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'dateOfBirth': ParameterData.none(),
  'welcome': ParameterData.none(),
  'emailVerification': ParameterData.none(),
  'Notifications': ParameterData.none(),
  'createProfile': ParameterData.none(),
  'forgotPassword': ParameterData.none(),
  'Profile': (data) async => ParameterData(
        allParams: {
          'userID': getParameter<String>(data, 'userID'),
        },
      ),
  'Home': ParameterData.none(),
  'Threads': ParameterData.none(),
  'createPost': ParameterData.none(),
  'singlePost': (data) async => ParameterData(
        allParams: {
          'posts': await getDocumentParameter<PostsRecord>(
              data, 'posts', PostsRecord.fromSnapshot),
          'action': getParameter<int>(data, 'action'),
          'username': getParameter<String>(data, 'username'),
        },
      ),
  'singleThread': (data) async => ParameterData(
        allParams: {
          'thread': await getDocumentParameter<ThreadRecord>(
              data, 'thread', ThreadRecord.fromSnapshot),
          'action': getParameter<int>(data, 'action'),
          'username': getParameter<String>(data, 'username'),
        },
      ),
  'scrollPost': (data) async => ParameterData(
        allParams: {
          'uid': getParameter<String>(data, 'uid'),
          'post': await getDocumentParameter<PostsRecord>(
              data, 'post', PostsRecord.fromSnapshot),
        },
      ),
  'enterPin': ParameterData.none(),
  'createPin': ParameterData.none(),
  'settings': (data) async => ParameterData(
        allParams: {
          'settingsKey': getParameter<bool>(data, 'settingsKey'),
        },
      ),
  'BiometricTest': ParameterData.none(),
  'accountDeleted': ParameterData.none(),
  'BiometricPin': ParameterData.none(),
  'userInterface': (data) async => ParameterData(
        allParams: {
          'settingsKey': getParameter<bool>(data, 'settingsKey'),
        },
      ),
  'privacy': (data) async => ParameterData(
        allParams: {
          'settingsKey': getParameter<bool>(data, 'settingsKey'),
        },
      ),
  'notificationsSettings': ParameterData.none(),
  'security': (data) async => ParameterData(
        allParams: {
          'settingsKey': getParameter<bool>(data, 'settingsKey'),
        },
      ),
  'following': (data) async => ParameterData(
        allParams: {
          'uid': getParameter<String>(data, 'uid'),
        },
      ),
  'blocked': (data) async => ParameterData(
        allParams: {
          'settingsKey': getParameter<bool>(data, 'settingsKey'),
        },
      ),
  'followers': (data) async => ParameterData(
        allParams: {
          'uid': getParameter<String>(data, 'uid'),
        },
      ),
  'changePassword': ParameterData.none(),
  'changePin': ParameterData.none(),
  'viewData': (data) async => ParameterData(
        allParams: {
          'settingsKey': getParameter<bool>(data, 'settingsKey'),
        },
      ),
  'Search': ParameterData.none(),
  'chat_main': ParameterData.none(),
  'chatSearch': ParameterData.none(),
  'CheckProfile': ParameterData.none(),
  'EditProfile': ParameterData.none(),
  'chats_page': (data) async => ParameterData(
        allParams: {
          'chat': await getDocumentParameter<ChatsRecord>(
              data, 'chat', ChatsRecord.fromSnapshot),
        },
      ),
  'LoggingIn': ParameterData.none(),
  'spaces': (data) async => ParameterData(
        allParams: {
          'name': getParameter<String>(data, 'name'),
        },
      ),
  'preentry': ParameterData.none(),
  'Shorts': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
