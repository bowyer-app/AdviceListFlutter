import 'package:app/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppScaffold extends StatelessWidget {
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

  Widget buildTitle({
    required Color appbarColor,
    required Color appbarTextColor,
    required Color appbarIconColor,
  }) {
    final title = Text(
      _title,
      style: TextStyle(
        color: appbarTextColor,
      ),
    );
    return SafeArea(
      child: AppBar(
        backgroundColor: appbarColor,
        bottomOpacity: 0.0,
        elevation: _elevation,
        centerTitle: true,
        title: title,
        actions: _menuActions,
        iconTheme: IconThemeData(color: appbarIconColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return HookConsumer(
      builder: (BuildContext context, ref, child) {
        final appColors = ref.watch(appThemeProvider).appColors;
        return SafeArea(
          top: false,
          child: Scaffold(
            backgroundColor: appColors.primaryColorDark,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(46.0),
              child: buildTitle(
                appbarColor: appColors.primaryColor,
                appbarTextColor: appColors.primaryTextColor,
                appbarIconColor: appColors.primaryObjectColor,
              ),
            ),
            body: Container(
              color: appColors.surfaceColor,
              child: _body,
            ),
          ),
        );
      },
    );
  }
}
