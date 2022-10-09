import 'package:app/ui/component/app_button/app_button_widget.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuButton extends HookConsumerWidget {
  const MenuButton({
    Key? key,
    required this.onTap,
    this.menuText,
  }) : super(key: key);

  final VoidCallback onTap;
  final String? menuText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appThemeProvider).appColors;
    final l10n = L10n.of(context)!;
    final menu = Text(
      menuText ?? l10n.save,
      style: TextStyle(
        color: appColors.primaryTextColorAccent,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
    return AppButtonWidget(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
          right: 16,
        ),
        child: menu,
      ),
    );
  }
}
