import 'package:app/domain/date_vo.dart';
import 'package:app/domain/hide_filter.dart';
import 'package:app/domain/sort_type.dart';
import 'package:app/ui/advice/list/advice_list_item_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'advice_tab_page_state.freezed.dart';

@freezed
class AdviceTabPageState with _$AdviceTabPageState {
  const factory AdviceTabPageState({
    @Default([]) List<AdviceListItemModel> adviceAllList,
    @Default([]) List<AdviceListItemModel> adviceCompletedList,
    @Default([]) List<AdviceListItemModel> adviceInCompletedList,
    @Default("") String searchWord,
    @Default(false) bool searchWordHasFocus,
    DateVO? startDate,
    DateVO? endDate,
    @Default(HideFilter.display) HideFilter hideDone,
    @Default(SortType.desc) SortType sortType,
  }) = _AdviceTabPageState;

  factory AdviceTabPageState.init() => const _AdviceTabPageState();
}
