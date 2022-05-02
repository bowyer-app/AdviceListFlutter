import 'package:app/data/local/app_shared_preference.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appSharedPreferencesProvider = Provider<AppSharedPreferences>(
  (ref) => AppSharedPreferences(),
);
