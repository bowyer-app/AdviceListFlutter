import 'package:app/ui/theme/app_theme.dart';
import 'package:app/ui/theme/app_theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ThemeSwitchWidget extends ConsumerWidget {
  const ThemeSwitchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeController = ref.read(appThemeControllerProvider.notifier);
    final theme = ref.watch(appThemeProvider);
    final isDark = theme.mode == ThemeMode.dark;
    final appColors = theme.appColors;
    final initialLabelIndex = isDark ? 1 : 0;

    final toggle = ToggleSwitch(
      cornerRadius: 8,
      minWidth: 36.0,
      minHeight: 28.0,
      iconSize: 30.0,
      initialLabelIndex: initialLabelIndex,
      activeBgColor: [appColors.surfaceActive],
      activeFgColor: appColors.textActive,
      inactiveBgColor: appColors.surfaceInActive,
      inactiveFgColor: appColors.textInActive,
      totalSwitches: 2,
      icons: const [
        FontAwesomeIcons.sun,
        FontAwesomeIcons.moon,
      ],
      onToggle: (index) {
        themeController.toggle();
      },
    );
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.4,
          color: appColors.surfaceActive,
        ),
        borderRadius: BorderRadius.circular(9),
        color: appColors.surfaceActive,
      ),
      margin: const EdgeInsets.only(
        top: 8,
        bottom: 8,
        right: 8,
      ),
      child: toggle,
    );
  }
}
