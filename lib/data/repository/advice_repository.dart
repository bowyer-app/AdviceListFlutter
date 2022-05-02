import 'package:app/domain/advice.dart';
import 'package:app/domain/advice_search_query.dart';

abstract class AdviceRepository {
  /// Adviceを保存する
  Future<void> save(Advice advice);

  /// List<Advice>を取得する
  Future<List<Advice>> loadAdviceList({required AdviceSearchQuery query});
}
