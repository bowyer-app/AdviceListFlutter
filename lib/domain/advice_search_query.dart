import 'package:app/domain/sort_type.dart';

import 'date_vo.dart';
import 'hide_filter.dart';

class AdviceSearchQuery {
  final String searchText;
  final DateVO? startDate;
  final DateVO? endDate;
  final HideFilter hideDone;
  final SortType sortType;

  AdviceSearchQuery({
    required this.searchText,
    this.startDate,
    this.endDate,
    required this.hideDone,
    required this.sortType,
  });
}
