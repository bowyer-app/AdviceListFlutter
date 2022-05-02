import 'package:app/data/repository/advice_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'advice_data_source_provider.dart';

final adviceRepositoryProvider = Provider(
  (ref) => AdviceRepositoryImpl(
    adviceDataSource: ref.read(adviceDataSourceProvider),
  ),
);
