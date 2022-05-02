import 'package:app/data/model/local/db_const.dart';

enum SortType { asc, desc }

extension SortTypeExt on SortType {
  String toOrderBy() {
    switch (this) {
      case SortType.asc:
        return DBConst.asc;
      case SortType.desc:
        return DBConst.desc;
    }
  }
}

