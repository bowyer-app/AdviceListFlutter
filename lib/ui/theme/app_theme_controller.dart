import 'package:app/data/provider/theme_repository_provider.dart';
import 'package:app/data/repository/theme_repository.dart';
import 'package:app/ui/theme/app_theme_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appThemeControllerProvider =
    StateNotifierProvider<AppThemeController, AppThemeState>(
  (ref) => AppThemeController(
    themeRepository: ref.read(
      themeRepositoryProvider,
    ),
  ),
);

class AppThemeController extends StateNotifier<AppThemeState> {
  AppThemeController({
    required ThemeRepository themeRepository,
  })  : _themeRepository = themeRepository,
        super(AppThemeState.init());

  final ThemeRepository _themeRepository;

  Future<void> init({
    required Brightness brightness,
  }) async {
    state = state.copyWith.call(
      themeMode: brightness.themeMode(),
    );
  }

  Future<void> didChangePlatformBrightness({
    required Brightness brightness,
  }) async {
    state = state.copyWith.call(
      themeMode: brightness.themeMode(),
    );
  }
}

extension _BrightnessExt on Brightness {
  ThemeMode themeMode() =>
      this == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
}
