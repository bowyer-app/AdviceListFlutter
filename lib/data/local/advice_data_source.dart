import 'package:app/data/model/local/db_advice.dart';
import 'package:app/data/provider/db_provider.dart';
import 'package:app/data/translator/advice_translator.dart';
import 'package:app/domain/advice.dart';
import 'package:app/domain/advice_search_query.dart';
import 'package:app/domain/date_vo.dart';
import 'package:app/domain/hide_filter.dart';
import 'package:app/domain/sort_type.dart';
import 'package:app/foundation/extension/bool_ext.dart';

class AdviceDataSource {
  final DBProvider _dbProvider = DBProvider.instance;

  Future<List<Advice>> loadAdviceList({
    required AdviceSearchQuery query,
  }) async {
    final db = await _dbProvider.database;
    final orderBy = query.sortType.toOrderBy();
    final rows = await db.rawQuery(
      '''
        SELECT * from ${DBAdvice.tableName}
        ORDER BY ${DBAdvice.keyUpdated} $orderBy
      ''',
    );
    if (rows.isEmpty) {
      return [];
    }

    final list = rows
        .map(
          (e) => AdviceTranslator.fromDBAdvice(
            dbAdvice: DBAdvice.fromJson(e),
          ),
        )
        .toList();
    var result = list;
    // テキストフィルター
    if (query.searchText.isNotEmpty) {
      result = result
          .where((element) => element.adviceText.contains(query.searchText))
          .toList();
    }
    // startDateより後か
    if (query.startDate != null) {
      result = result
          .where((element) =>
              !(query.startDate?.isBefore(element.created) ?? false))
          .toList();
    }
    // endDateより前か
    if (query.endDate != null) {
      result = result
          .where((element) => query.endDate?.isBefore(element.created) ?? false)
          .toList();
    }
    // 完了済みを表示するか
    if (query.hideDone.isHideEmpty()) {
      result = result.where((element) => !element.done).toList();
    }

    return result;
  }

  Future<void> save(Advice advice) async {
    final db = await _dbProvider.database;
    final DBAdvice dbAdvice = DBAdvice(
      id: advice.id?.value,
      adviceText: advice.adviceText,
      created: advice.created?.value ?? "",
      updated: advice.updated?.value ?? "",
      done: advice.done.toDBInt(),
    );
    if (advice.id == null) {
      db.insert(DBAdvice.tableName, dbAdvice.toJson());
      return;
    }
    db.update(
      DBAdvice.tableName,
      dbAdvice.toJson(),
      where: "${DBAdvice.keyId} = ? ",
      whereArgs: [advice.id!.value],
    );
  }
}
