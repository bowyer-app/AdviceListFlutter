import 'package:flutter_gen/gen_l10n/l10n.dart';

/// 指導メモの完了タイプ
enum CompleteType { all, completed, inCompleted }

extension CompleteTypeExt on CompleteType {
  String toText(L10n l10n) {
    switch (this) {
      case CompleteType.completed:
        return l10n.completed;
      case CompleteType.inCompleted:
        return l10n.inCompleted;
      default:
        return l10n.all;
    }
  }
}
