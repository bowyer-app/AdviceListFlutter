import 'package:app/domain/advice_id.dart';
import 'package:app/domain/date_vo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'advice.freezed.dart';

@freezed
class Advice with _$Advice {
  factory Advice({
    AdviceId? id,
    required String adviceText,
    DateVO? created,
    DateVO? updated,
    required bool done,
  }) = _Advice;
}
