import 'package:app/data/provider/advice_repository_provider.dart';
import 'package:app/data/repository/advice_repository.dart';
import 'package:app/domain/advice.dart';
import 'package:app/domain/advice_search_query.dart';
import 'package:app/domain/date_vo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'list/advice_list_item_model.dart';
import 'state/advice_tab_page_state.dart';

final adviceTabPageControllerProvider =
    StateNotifierProvider<AdviceTabPageController, AdviceTabPageState>(
  (ref) => AdviceTabPageController(
    adviceRepository: ref.read(adviceRepositoryProvider),
  ),
);

class AdviceTabPageController extends StateNotifier<AdviceTabPageState> {
  AdviceTabPageController({required this.adviceRepository})
      : super(AdviceTabPageState.init());

  final AdviceRepository adviceRepository;

  void onBuildStart() {
    _load();
  }

  Future<void> _load() async {
    final query = AdviceSearchQuery(
      searchText: state.searchWord,
      startDate: state.startDate,
      endDate: state.endDate,
      hideDone: state.hideDone,
      sortType: state.sortType,
    );
    final adviceList = await adviceRepository.loadAdviceList(query: query).then(
          (value) => value.map((e) => AdviceListItemModel(advice: e)).toList(),
        );
    final completed =
        adviceList.where((element) => element.advice.done).toList();
    final inCompleted =
        adviceList.where((element) => !element.advice.done).toList();
    state = state.copyWith.call(
      adviceAllList: adviceList,
      adviceCompletedList: completed,
      adviceInCompletedList: inCompleted,
    );
  }

  Future<void> onEdited() async {
    await _load();
  }

  Future<void> onTapCheck(AdviceListItemModel model) async {
    final advice = model.advice;

    final newAdvice = Advice(
      id: advice.id,
      adviceText: advice.adviceText,
      done: !advice.done,
      created: advice.created,
      updated: DateVO.getToday(),
    );
    adviceRepository.save(newAdvice);
    _load();
  }
}
