import 'package:app/data/local/theme_data_source.dart';
import 'package:app/data/repository/theme_repository.dart';
import 'package:flutter/material.dart';

class ThemeRepositoryImpl extends ThemeRepository {
  ThemeRepositoryImpl({
    required ThemeDataSource dataSource,
  }) : _dataSource = dataSource;

  final ThemeDataSource _dataSource;

  @override
  Future<ThemeMode> loadThemeMode() => _dataSource.loadThemeMode();

  @override
  Future<void> saveThemeMode(ThemeMode theme) =>
      _dataSource.saveThemeMode(theme);
}
