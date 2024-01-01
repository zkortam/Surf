import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/push_notifications/push_notifications_util.dart';
import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'index.dart';

import '/backend/firebase_dynamic_links/firebase_dynamic_links.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await initFirebase();

  await FlutterFlowTheme.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<BaseAuthUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = surfFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      const Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Surf',
      localizationsDelegates: const [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('af'),
        Locale('ak'),
        Locale('sq'),
        Locale('am'),
        Locale('hy'),
        Locale('az'),
        Locale('be'),
        Locale('bn'),
        Locale('bs'),
        Locale('bg'),
        Locale('my'),
        Locale('km'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
        Locale('hr'),
        Locale('cs'),
        Locale('da'),
        Locale('et'),
        Locale('nl'),
        Locale('fi'),
        Locale('fr'),
        Locale('ka'),
        Locale('de'),
        Locale('el'),
        Locale('gu'),
        Locale('he'),
        Locale('hi'),
        Locale('hu'),
        Locale('is'),
        Locale('id'),
        Locale('it'),
        Locale('ja'),
        Locale('kk'),
        Locale('ko'),
        Locale('lo'),
        Locale('la'),
        Locale('lv'),
        Locale('lt'),
        Locale('mk'),
        Locale('ms'),
        Locale('mn'),
        Locale('ne'),
        Locale('no'),
        Locale('pa'),
        Locale('fa'),
        Locale('pl'),
        Locale('pt'),
        Locale('ps'),
        Locale('ro'),
        Locale('rm'),
        Locale('ru'),
        Locale('sr'),
        Locale('sk'),
        Locale('sl'),
        Locale('es'),
        Locale('sw'),
        Locale('sv'),
        Locale('tl'),
        Locale('ta'),
        Locale('te'),
        Locale('th'),
        Locale('tr'),
        Locale('uk'),
        Locale('ur'),
        Locale('uz'),
        Locale('vi'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: MaterialStateProperty.all(false),
          trackVisibility: MaterialStateProperty.all(false),
          interactive: false,
          thickness: MaterialStateProperty.all(2.0),
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.dragged)) {
              return const Color(0xff14181b);
            }
            if (states.contains(MaterialState.hovered)) {
              return const Color(0xff14181b);
            }
            return const Color(0xff14181b);
          }),
          minThumbLength: 2.0,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: MaterialStateProperty.all(false),
          trackVisibility: MaterialStateProperty.all(false),
          interactive: false,
          thickness: MaterialStateProperty.all(2.0),
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.dragged)) {
              return const Color(0xffffffff);
            }
            if (states.contains(MaterialState.hovered)) {
              return const Color(0xffffffff);
            }
            return const Color(0xffffffff);
          }),
          minThumbLength: 2.0,
        ),
      ),
      themeMode: _themeMode,
      routerConfig: _router,
      builder: (_, child) => DynamicLinksHandler(
        router: _router,
        child: child!,
      ),
    );
  }
}

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key, this.initialPage, this.page});

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'Home';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Home': const HomeWidget(),
      'Threads': const ThreadsWidget(),
      'createPost': const CreatePostWidget(),
      'Shorts': const ShortsWidget(),
      'Profile': const ProfileWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    final MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      body: MediaQuery(
          data: queryData
              .removeViewInsets(removeBottom: true)
              .removeViewPadding(removeBottom: true),
          child: _currentPage ?? tabs[_currentPageName]!),
      extendBody: true,
      bottomNavigationBar: Visibility(
        visible: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        ),
        child: FloatingNavbar(
          currentIndex: currentIndex,
          onTap: (i) => setState(() {
            _currentPage = null;
            _currentPageName = tabs.keys.toList()[i];
          }),
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          selectedItemColor: const Color(0xFF574CF6),
          unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
          selectedBackgroundColor: const Color(0x00000000),
          borderRadius: 120.0,
          itemBorderRadius: 0.0,
          margin: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
          width: double.infinity,
          elevation: 100.0,
          items: [
            FloatingNavbarItem(
              customWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: currentIndex == 0
                        ? const Color(0xFF574CF6)
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ],
              ),
            ),
            FloatingNavbarItem(
              customWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.gesture_outlined,
                    color: currentIndex == 1
                        ? const Color(0xFF574CF6)
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ],
              ),
            ),
            FloatingNavbarItem(
              customWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: currentIndex == 2
                        ? const Color(0xFF574CF6)
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ],
              ),
            ),
            FloatingNavbarItem(
              customWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.sort,
                    color: currentIndex == 3
                        ? const Color(0xFF574CF6)
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 22.0,
                  ),
                ],
              ),
            ),
            FloatingNavbarItem(
              customWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_rounded,
                    color: currentIndex == 4
                        ? const Color(0xFF574CF6)
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
