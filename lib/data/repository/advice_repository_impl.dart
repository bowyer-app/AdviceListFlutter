import 'package:app/data/local/advice_data_source.dart';
import 'package:app/domain/advice.dart';
import 'package:app/domain/advice_search_query.dart';

import 'advice_repository.dart';

class AdviceRepositoryImpl extends AdviceRepository {
  AdviceRepositoryImpl({
    required this.adviceDataSource,
  });

  final AdviceDataSource adviceDataSource;

  @override
  Future<List<Advice>> loadAdviceList({
    required AdviceSearchQuery query,
  }) =>
      adviceDataSource.loadAdviceList(query: query);

  @override
  Future<void> save(Advice advice) => adviceDataSource.save(advice);
}
