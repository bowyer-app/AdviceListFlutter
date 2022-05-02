import 'package:freezed_annotation/freezed_annotation.dart';

@sealed
class AdviceEditPageEvent {}

class AdviceEditPageFinish extends AdviceEditPageEvent {}

class AdviceEditPageNeedText extends AdviceEditPageEvent {}
