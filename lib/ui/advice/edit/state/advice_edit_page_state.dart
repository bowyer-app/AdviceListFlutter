import 'package:app/domain/advice.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'advice_edit_page_state.freezed.dart';

@freezed
class AdviceEditPageState with _$AdviceEditPageState {
  const factory AdviceEditPageState({
    Advice? advice,
    @Default("") String adviceText,
    @Default("") String inputText,
  }) = _AdviceEditPageState;

  factory AdviceEditPageState.init() => const _AdviceEditPageState();
}
