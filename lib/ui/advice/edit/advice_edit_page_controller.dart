import 'dart:async';

import 'package:app/data/provider/advice_repository_provider.dart';
import 'package:app/data/repository/advice_repository.dart';
import 'package:app/domain/advice.dart';
import 'package:app/domain/date_vo.dart';
import 'package:app/ui/advice/edit/advice_edit_page_event.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import 'state/advice_edit_page_state.dart';

final adviceEditPageController =
    StateNotifierProvider<AdviceEditPageController, AdviceEditPageState>(
  (ref) => AdviceEditPageController(
    adviceRepository: ref.read(adviceRepositoryProvider),
  ),
);

class AdviceEditPageController extends StateNotifier<AdviceEditPageState> {
  AdviceEditPageController({required this.adviceRepository})
      : super(AdviceEditPageState.init());

  final AdviceRepository adviceRepository;

  final _adviceEditPageEvent = PublishSubject<AdviceEditPageEvent>();

  StreamController<AdviceEditPageEvent> get adviceEditPageEvent =>
      _adviceEditPageEvent;

  void onInitState(Advice? advice) {
    state = state.copyWith.call(
      advice: advice,
      adviceText: advice?.adviceText ?? "",
    );
  }

  void onTextChanged(String text) {
    state = state.copyWith.call(inputText: text);
  }

  Future<void> onTapSave() async {
    if (state.inputText.isEmpty) {
      _adviceEditPageEvent.sink.add(AdviceEditPageNeedText());
      return;
    }
    final currentAdvice = state.advice ??
        Advice(
          adviceText: state.inputText,
          created: DateVO.getToday(),
          done: false,
        );
    final advice = currentAdvice.copyWith.call(
      adviceText: state.inputText,
      updated: DateVO.getToday(),
    );
    await adviceRepository.save(advice);
    _adviceEditPageEvent.sink.add(AdviceEditPageFinish());
  }
}
