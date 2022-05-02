import 'package:app/data/local/theme_data_source_impl.dart';
import 'package:app/data/repository/theme_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final themeRepositoryProvider = Provider(
  (ref) => ThemeRepositoryImpl(
    dataSource: ref.read(
      themeDataSourceProvider,
    ),
  ),
);
