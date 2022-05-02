import 'package:app/domain/advice_id.dart';

class AdviceIdTranslator {
  static AdviceId? from(int? adviceId) {
    if (adviceId == null) {
      return null;
    }
    return AdviceId(value: adviceId);
  }
}
