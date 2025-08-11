import 'package:app/data/local/theme_data_source.dart';
import 'package:app/data/repository/theme_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockThemeDataSource extends Mock implements ThemeDataSource {}

void main() {
  late ThemeRepositoryImpl themeRepository;
  late MockThemeDataSource mockThemeDataSource;

  setUp(() {
    mockThemeDataSource = MockThemeDataSource();
    themeRepository = ThemeRepositoryImpl(dataSource: mockThemeDataSource);
  });

  group('ThemeRepositoryImpl', () {
    test('loadThemeMode should return theme mode from data source', () async {
      // Arrange
      when(() => mockThemeDataSource.loadThemeMode())
          .thenAnswer((_) async => ThemeMode.dark);

      // Act
      final result = await themeRepository.loadThemeMode();

      // Assert
      expect(result, ThemeMode.dark);
      verify(() => mockThemeDataSource.loadThemeMode()).called(1);
    });

    test('saveThemeMode should call saveThemeMode on data source', () async {
      // Arrange
      when(() => mockThemeDataSource.saveThemeMode(ThemeMode.light))
          .thenAnswer((_) async {});

      // Act
      await themeRepository.saveThemeMode(ThemeMode.light);

      // Assert
      verify(() => mockThemeDataSource.saveThemeMode(ThemeMode.light))
          .called(1);
    });
  });
}
