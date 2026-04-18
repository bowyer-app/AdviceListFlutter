import 'package:app/ui/route/app_route.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'ui/theme/app_theme_controller.dart';

class App extends StatefulHookConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _App();
}

class _App extends ConsumerState<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    final appThemeController = ref.read(appThemeControllerProvider.notifier);
    appThemeController.didChangePlatformBrightness(
      brightness: WidgetsBinding.instance.window.platformBrightness,
    );
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = WidgetsBinding.instance.window.platformBrightness;
    final appThemeController = ref.read(appThemeControllerProvider.notifier);
    appThemeController.init(
      brightness: brightness,
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: brightness,
      ),
    );

    final appRouter = useMemoized(() => AppRouter());

    return MaterialApp.router(
      theme: AppTheme.light().data,
      darkTheme: AppTheme.dark().data,
      themeMode: ThemeMode.system,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
