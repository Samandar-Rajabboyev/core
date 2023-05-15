import 'package:core/app_state/localization.dart';
import 'package:core/app_state/providers/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import 'app_state/providers/theme_provider.dart';

String badInternetConnection = 'Not Internet Connection';
String appError = 'Something went wrong';

class CoreApp extends MaterialApp {
  final bool? dDebugShowMaterialGrid;
  final bool? dShowPerformanceOverlay;
  final bool? dCheckerboardRasterCacheImages;
  final bool? dCheckerboardOffscreenLayers;
  final bool? dShowSemanticsDebugger;
  final bool? dDebugShowCheckedModeBanner;
  final Iterable<Locale>? dSupportedLocales;
  final GoRouter appRouter;
  final List<BlocProvider> providers;
  final String? badInternetConnection;
  final String? appError;

  const CoreApp({
    Key? key,
    this.badInternetConnection,
    this.appError,
    required this.providers,
    required this.appRouter,
    super.title,
    super.actions,
    super.builder,
    this.dSupportedLocales,
    this.dCheckerboardOffscreenLayers,
    this.dCheckerboardRasterCacheImages,
    super.color,
    super.darkTheme,
    this.dDebugShowCheckedModeBanner,
    this.dDebugShowMaterialGrid,
    super.highContrastDarkTheme,
    super.highContrastTheme,
    super.home,
    super.initialRoute,
    super.locale,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.localizationsDelegates,
    super.navigatorKey,
    super.navigatorObservers,
    super.onGenerateInitialRoutes,
    super.onGenerateRoute,
    super.onGenerateTitle,
    super.onUnknownRoute,
    super.restorationScopeId,
    super.routes,
    super.scaffoldMessengerKey,
    super.scrollBehavior,
    super.shortcuts,
    this.dShowPerformanceOverlay,
    this.dShowSemanticsDebugger,
    super.supportedLocales,
    super.theme,
    super.themeAnimationCurve,
    super.themeAnimationDuration,
    super.themeMode,
    super.useInheritedMediaQuery,
  }) : super(key: key);

  @override
  State<CoreApp> createState() => _CoreAppState();
}

class _CoreAppState extends State<CoreApp> {
  @override
  void initState() {
    super.initState();
    if (widget.badInternetConnection != null) badInternetConnection = widget.badInternetConnection!;
    if (widget.appError != null) appError = widget.appError!;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final themeMode = ref.watch(themeModeProvider);
        final locale = ref.watch(localeProvider);
        ref.listen(themeModeProvider, (previous, next) {
          if (next == ThemeMode.dark) {
            setSystemNavigationBarColor(ThemeMode.dark == themeMode ? Colors.white : Colors.black);
          }
        });
        return MultiBlocProvider(
          providers: widget.providers,
          child: Sizer(
            builder: (context, orientation, deviceType) {
              return MaterialApp.router(
                locale: widget.locale ?? locale,
                title: widget.title,
                color: widget.color,
                actions: widget.actions,
                builder: widget.builder,
                darkTheme: widget.darkTheme,
                theme: widget.theme,
                themeMode: widget.themeMode ?? themeMode,
                routeInformationParser: widget.appRouter.routeInformationParser,
                routeInformationProvider: widget.appRouter.routeInformationProvider,
                routerDelegate: widget.appRouter.routerDelegate,
                localizationsDelegates: [
                  ...?(widget.localizationsDelegates),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: widget.dSupportedLocales ?? Localization.all,
                debugShowCheckedModeBanner: widget.dDebugShowCheckedModeBanner ?? false,
                debugShowMaterialGrid: widget.dDebugShowMaterialGrid ?? false,
                checkerboardRasterCacheImages: widget.dCheckerboardRasterCacheImages ?? false,
                checkerboardOffscreenLayers: widget.dCheckerboardOffscreenLayers ?? false,
                showSemanticsDebugger: widget.dShowSemanticsDebugger ?? false,
                showPerformanceOverlay: widget.dShowPerformanceOverlay ?? false,
                localeListResolutionCallback: widget.localeListResolutionCallback,
                localeResolutionCallback: widget.localeResolutionCallback,
                onGenerateTitle: widget.onGenerateTitle,
                restorationScopeId: widget.restorationScopeId,
                scaffoldMessengerKey: widget.scaffoldMessengerKey,
                scrollBehavior: widget.scrollBehavior,
                shortcuts: widget.shortcuts,
                useInheritedMediaQuery: widget.useInheritedMediaQuery,
                themeAnimationCurve: widget.themeAnimationCurve,
                themeAnimationDuration: widget.themeAnimationDuration,
                highContrastDarkTheme: widget.highContrastDarkTheme,
                highContrastTheme: widget.highContrastTheme,
              );
            },
          ),
        );
      },
    );
  }
}
