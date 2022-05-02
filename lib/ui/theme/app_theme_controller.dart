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

  Future<void> init() async {
    final currentTheme = await _themeRepository.loadThemeMode();
    state = state.copyWith.call(themeMode: currentTheme);
  }

  Future<void> toggle() async {
    final currentTheme = await _themeRepository.loadThemeMode();
    final ThemeMode themeMode;
    switch (currentTheme) {
      case ThemeMode.dark:
        themeMode = ThemeMode.light;
        break;
      case ThemeMode.light:
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.light;
        break;
    }
    await _themeRepository.saveThemeMode(themeMode);
    state = state.copyWith.call(themeMode: themeMode);
  }
}
