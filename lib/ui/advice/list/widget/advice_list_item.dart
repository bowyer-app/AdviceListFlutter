import 'package:app/ui/component/app_button/app_button_widget.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../advice_list_item_model.dart';

class AdviceListItem extends ConsumerWidget {
  final AdviceListItemModel _model;
  final VoidCallback _onTap;
  final VoidCallback _onTapCheck;

  const AdviceListItem({
    Key? key,
    required AdviceListItemModel model,
    required VoidCallback onTap,
    required onTapCheck,
  })  : _model = model,
        _onTap = onTap,
        _onTapCheck = onTapCheck,
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appThemeProvider).appColors;
    final adviceText = Text(
      _model.advice.adviceText,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: appColors.primaryTextColor,
      ),
      maxLines: 1,
    );
    final adviceTextFull = Text(
      _model.advice.adviceText,
      style: TextStyle(
        color: appColors.primaryTextColor,
      ),
    );
    final expandable = ExpandablePanel(
      header: _Header(_model.advice.updated!.value),
      collapsed: adviceText,
      expanded: adviceTextFull,
      theme: ExpandableThemeData(
        tapHeaderToExpand: false,
        hasIcon: true,
        iconColor: appColors.objectActive,
        tapBodyToExpand: false,
        headerAlignment: ExpandablePanelHeaderAlignment.center,
      ),
    );
    final row = Row(
      children: [
        _Checkbox(
          done: _model.advice.done,
          onTapCheck: _onTapCheck,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: expandable,
          ),
        ),
      ],
    );
    return Container(
      color: appColors.surfaceColor,
      child: AppButtonWidget(
        onTap: _onTap,
        child: row,
      ),
    );
  }
}

class _Header extends ConsumerWidget {
  const _Header(this.updated);

  final String updated;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appThemeProvider).appColors;
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: Text(
        updated,
        style: TextStyle(
          color: appColors.primaryTextColor,
        ),
      ),
    );
  }
}

class _Checkbox extends ConsumerWidget {
  const _Checkbox({
    required this.done,
    required this.onTapCheck,
  });

  final bool done;
  final VoidCallback onTapCheck;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appThemeProvider).appColors;
    return Checkbox(
      activeColor: appColors.primaryObjectColorAccent,
      value: done,
      onChanged: (value) {
        onTapCheck();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      side: MaterialStateBorderSide.resolveWith(
        (states) => BorderSide(
          width: 1.0,
          color: appColors.primaryObjectColorAccent,
        ),
      ),
    );
  }
}
