import 'package:app/ui/theme/app_colors.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppScaffold extends ConsumerWidget {
  final Widget _body;
  final List<Widget> _menuActions;
  final String _title;
  final double _elevation;

  const AppScaffold({
    Key? key,
    required Widget body,
    required String title,
    List<Widget>? menuActions,
    bool disableElevation = false,
  })  : _body = body,
        _title = title,
        _menuActions = menuActions ?? const [],
        _elevation = disableElevation ? 0.0 : 1.0,
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appThemeProvider).appColors;
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: appColors.primaryColorDark,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(46.0),
          child: _AppBar(
            titleText: _title,
            appColors: appColors,
            menuActions: _menuActions,
            elevation: _elevation,
          ),
        ),
        body: Container(
          color: appColors.surfaceColor,
          child: _body,
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    required this.titleText,
    required this.appColors,
    required this.menuActions,
    required this.elevation,
  });

  final String titleText;
  final AppColors appColors;
  final List<Widget> menuActions;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final title = Text(
      titleText,
      style: TextStyle(
        color: appColors.primaryTextColor,
      ),
    );
    return SafeArea(
      child: AppBar(
        backgroundColor: appColors.primaryColor,
        bottomOpacity: 0.0,
        elevation: elevation,
        centerTitle: true,
        title: title,
        actions: menuActions,
        iconTheme: IconThemeData(color: appColors.primaryObjectColor),
      ),
    );
  }
}
