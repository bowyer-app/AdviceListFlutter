import 'package:flutter/material.dart';

/// テーマ保存用のrepository
abstract class ThemeRepository {
  Future<ThemeMode> loadThemeMode();

  Future<void> saveThemeMode(ThemeMode theme);
}
