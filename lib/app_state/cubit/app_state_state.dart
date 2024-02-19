part of 'app_state_cubit.dart';

class AppState {
  final ThemeMode? themeMode;
  final Locale? locale;

  AppState({this.themeMode, this.locale});

  AppState copyWith({
    ThemeMode? themeMode,
    Locale? locale,
  }) =>
      AppState(
        themeMode: themeMode ?? this.themeMode,
        locale: locale ?? this.locale,
      );
}
