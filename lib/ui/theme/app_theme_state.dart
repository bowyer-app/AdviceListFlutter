import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_theme_state.freezed.dart';

@freezed
class AppThemeState with _$AppThemeState {
  const factory AppThemeState({
    @Default(ThemeMode.light) ThemeMode themeMode,
  }) = _AppThemeState;

  factory AppThemeState.init() => const _AppThemeState();
}
