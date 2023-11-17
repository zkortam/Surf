import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: appStateNotifier.loggedIn ? NavBarPage() : EntryWidget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : EntryWidget(),
          routes: [
            FFRoute(
              name: 'entry',
              path: 'entry',
              builder: (context, params) => EntryWidget(),
            ),
            FFRoute(
              name: 'signUp',
              path: 'signUp',
              builder: (context, params) => SignUpWidget(
                email: params.getParam('email', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'dateOfBirth',
              path: 'dateOfBirth',
              requireAuth: true,
              builder: (context, params) => DateOfBirthWidget(),
            ),
            FFRoute(
              name: 'welcome',
              path: 'welcome',
              requireAuth: true,
              builder: (context, params) => WelcomeWidget(),
            ),
            FFRoute(
              name: 'emailVerification',
              path: 'emailVerification',
              builder: (context, params) => EmailVerificationWidget(),
            ),
            FFRoute(
              name: 'Notifications',
              path: 'Notifications',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Notifications')
                  : NavBarPage(
                      initialPage: 'Notifications',
                      page: NotificationsWidget(),
                    ),
            ),
            FFRoute(
              name: 'createProfile',
              path: 'createProfile',
              requireAuth: true,
              builder: (context, params) => CreateProfileWidget(),
            ),
            FFRoute(
              name: 'forgotPassword',
              path: 'forgotPassword',
              builder: (context, params) => ForgotPasswordWidget(),
            ),
            FFRoute(
              name: 'Profile',
              path: 'profile',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Profile')
                  : NavBarPage(
                      initialPage: 'Profile',
                      page: ProfileWidget(
                        userID: params.getParam('userID', ParamType.String),
                      ),
                    ),
            ),
            FFRoute(
              name: 'Home',
              path: 'home',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Home')
                  : NavBarPage(
                      initialPage: 'Home',
                      page: HomeWidget(),
                    ),
            ),
            FFRoute(
              name: 'Threads',
              path: 'threads',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Threads')
                  : NavBarPage(
                      initialPage: 'Threads',
                      page: ThreadsWidget(),
                    ),
            ),
            FFRoute(
              name: 'createPost',
              path: 'createpost',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'createPost')
                  : NavBarPage(
                      initialPage: 'createPost',
                      page: CreatePostWidget(),
                    ),
            ),
            FFRoute(
              name: 'singlePost',
              path: 'singlePost',
              requireAuth: true,
              asyncParams: {
                'posts': getDoc(['posts'], PostsRecord.fromSnapshot),
              },
              builder: (context, params) => SinglePostWidget(
                posts: params.getParam('posts', ParamType.Document),
                action: params.getParam('action', ParamType.int),
                username: params.getParam('username', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'singleThread',
              path: 'singleThread',
              requireAuth: true,
              asyncParams: {
                'thread': getDoc(['thread'], ThreadRecord.fromSnapshot),
              },
              builder: (context, params) => SingleThreadWidget(
                thread: params.getParam('thread', ParamType.Document),
                action: params.getParam('action', ParamType.int),
                username: params.getParam('username', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'scrollPost',
              path: 'scrollPost',
              requireAuth: true,
              asyncParams: {
                'post': getDoc(['posts'], PostsRecord.fromSnapshot),
              },
              builder: (context, params) => ScrollPostWidget(
                uid: params.getParam('uid', ParamType.String),
                post: params.getParam('post', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'enterPin',
              path: 'enterPin',
              requireAuth: true,
              builder: (context, params) => EnterPinWidget(),
            ),
            FFRoute(
              name: 'createPin',
              path: 'createPin',
              requireAuth: true,
              builder: (context, params) => CreatePinWidget(),
            ),
            FFRoute(
              name: 'settings',
              path: 'settings',
              requireAuth: true,
              builder: (context, params) => SettingsWidget(
                settingsKey: params.getParam('settingsKey', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'BiometricTest',
              path: 'biometricTest',
              requireAuth: true,
              builder: (context, params) => BiometricTestWidget(),
            ),
            FFRoute(
              name: 'accountDeleted',
              path: 'accountDeleted',
              requireAuth: true,
              builder: (context, params) => AccountDeletedWidget(),
            ),
            FFRoute(
              name: 'BiometricPin',
              path: 'biometricPin',
              requireAuth: true,
              builder: (context, params) => BiometricPinWidget(),
            ),
            FFRoute(
              name: 'userInterface',
              path: 'userInterface',
              requireAuth: true,
              builder: (context, params) => UserInterfaceWidget(
                settingsKey: params.getParam('settingsKey', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'privacy',
              path: 'privacy',
              requireAuth: true,
              builder: (context, params) => PrivacyWidget(
                settingsKey: params.getParam('settingsKey', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'notificationsSettings',
              path: 'notificationsSettings',
              requireAuth: true,
              builder: (context, params) => NotificationsSettingsWidget(),
            ),
            FFRoute(
              name: 'security',
              path: 'security',
              requireAuth: true,
              builder: (context, params) => SecurityWidget(
                settingsKey: params.getParam('settingsKey', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'following',
              path: 'following',
              requireAuth: true,
              builder: (context, params) => FollowingWidget(
                uid: params.getParam('uid', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'blocked',
              path: 'blocked',
              requireAuth: true,
              builder: (context, params) => BlockedWidget(
                settingsKey: params.getParam('settingsKey', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'followers',
              path: 'followers',
              requireAuth: true,
              builder: (context, params) => FollowersWidget(
                uid: params.getParam('uid', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'changePassword',
              path: 'changePassword',
              requireAuth: true,
              builder: (context, params) => ChangePasswordWidget(),
            ),
            FFRoute(
              name: 'changePin',
              path: 'changePin',
              requireAuth: true,
              builder: (context, params) => ChangePinWidget(),
            ),
            FFRoute(
              name: 'viewData',
              path: 'viewData',
              requireAuth: true,
              builder: (context, params) => ViewDataWidget(
                settingsKey: params.getParam('settingsKey', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'Search',
              path: 'search',
              requireAuth: true,
              builder: (context, params) => SearchWidget(),
            ),
            FFRoute(
              name: 'chat_main',
              path: 'chat',
              requireAuth: true,
              builder: (context, params) => ChatMainWidget(),
            ),
            FFRoute(
              name: 'chatSearch',
              path: 'chatSearch',
              requireAuth: true,
              builder: (context, params) => ChatSearchWidget(),
            ),
            FFRoute(
              name: 'CheckProfile',
              path: 'checkProfile',
              requireAuth: true,
              builder: (context, params) => CheckProfileWidget(),
            ),
            FFRoute(
              name: 'EditProfile',
              path: 'editProfile',
              requireAuth: true,
              builder: (context, params) => EditProfileWidget(),
            ),
            FFRoute(
              name: 'chats_page',
              path: 'chatsPage',
              requireAuth: true,
              asyncParams: {
                'chat': getDoc(['chats'], ChatsRecord.fromSnapshot),
              },
              builder: (context, params) => ChatsPageWidget(
                chat: params.getParam('chat', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'muluploadtest',
              path: 'muluploadtest',
              requireAuth: true,
              builder: (context, params) => MuluploadtestWidget(),
            ),
            FFRoute(
              name: 'LoggingIn',
              path: 'loggingIn',
              requireAuth: true,
              builder: (context, params) => LoggingInWidget(),
            ),
            FFRoute(
              name: 'spaces',
              path: 'space',
              requireAuth: true,
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: SpacesWidget(
                  name: params.getParam('name', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'Bob',
              path: 'bob',
              requireAuth: true,
              builder: (context, params) => BobWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/entry';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 300),
      );
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    Key? key,
    required this.state,
    required this.child,
  }) : super(key: key);

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();
    // Handle erroneous links from Firebase Dynamic Links.
    if (widget.state.location.startsWith('/link?request_ip_version')) {
      SchedulerBinding.instance.addPostFrameCallback((_) => context.go('/'));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
