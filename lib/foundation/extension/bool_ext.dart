import 'package:app/data/model/local/db_const.dart';

extension BoolExt on bool {
  int toDBInt() {
    if (this) {
      return DBConst.isTrue;
    } else {
      return DBConst.isFalse;
    }
  }
}
