import 'package:app/ui/advice/advice_tab_page.dart';
import 'package:app/ui/advice/edit/advice_edit_page.dart';
import 'package:auto_route/auto_route.dart';

export 'app_route.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: AdviceTabPage,
      initial: true,
    ),
    AutoRoute(
      path: '/adviceEdit',
      page: AdviceEditPage,
    ),
  ],
)
class $AppRouter {}
