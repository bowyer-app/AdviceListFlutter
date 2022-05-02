import 'package:app/ui/component/app_button/app_button_widget.dart';
import 'package:app/ui/theme/app_colors.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../advice_list_item_model.dart';

class AdviceListItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return HookConsumer(
      builder: (BuildContext context, ref, child) {
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
          header: _buildHeader(appColors),
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
            _buildCheckbox(appColors),
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
            child: row,
            onTap: _onTap,
          ),
        );
      },
    );
  }

  Widget _buildHeader(AppColors appColors) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: Text(
        _model.advice.updated!.value,
        style: TextStyle(
          color: appColors.primaryTextColor,
        ),
      ),
    );
  }

  Widget _buildCheckbox(AppColors appColors) {
    return Checkbox(
      activeColor: appColors.primaryObjectColorAccent,
      value: _model.advice.done,
      onChanged: (value) {
        _onTapCheck();
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
