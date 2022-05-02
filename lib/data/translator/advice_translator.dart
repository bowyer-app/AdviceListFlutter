import 'package:app/data/model/local/db_advice.dart';
import 'package:app/data/model/local/db_const.dart';
import 'package:app/domain/advice.dart';
import 'package:app/domain/date_vo.dart';

import 'advice_id_translator.dart';

class AdviceTranslator {
  static Advice fromDBAdvice({required DBAdvice dbAdvice}) {
    return Advice(
      id: AdviceIdTranslator.from(dbAdvice.id),
      adviceText: dbAdvice.adviceText,
      created: DateVO(dbAdvice.created),
      updated: DateVO(dbAdvice.updated),
      done: dbAdvice.done == DBConst.isTrue,
    );
  }
}
