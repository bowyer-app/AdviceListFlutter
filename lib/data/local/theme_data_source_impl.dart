import 'package:app/data/local/app_shared_preference.dart';
import 'package:app/data/local/theme_data_source.dart';
import 'package:app/data/provider/app_shared_preference_provider.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeDataSourceProvider = Provider(
  (ref) => ThemeDataSourceImpl(
    prefs: ref.read(
      appSharedPreferencesProvider,
    ),
  ),
);

class ThemeDataSourceImpl extends ThemeDataSource {
  ThemeDataSourceImpl({
    required AppSharedPreferences prefs,
  }) : _prefs = prefs;

  static const String keyThemeMode = 'theme_mode';

  final AppSharedPreferences _prefs;

  @override
  Future<ThemeMode> loadThemeMode() async {
    final prefs = await _prefs.getInstance();
    return EnumToString.fromString(
            ThemeMode.values, prefs.getString(keyThemeMode) ?? "") ??
        ThemeMode.light;
  }

  @override
  Future<void> saveThemeMode(ThemeMode theme) async {
    final prefs = await _prefs.getInstance();
    prefs.setString(keyThemeMode, EnumToString.convertToString(theme));
  }
}
