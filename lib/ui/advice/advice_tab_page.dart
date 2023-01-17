import 'package:app/domain/complete_type.dart';
import 'package:app/ui/advice/advice_tab_page_controller.dart';
import 'package:app/ui/component/fab/advice_add_fab_widget.dart';
import 'package:app/ui/component/fab/filter_fab_widget.dart';
import 'package:app/ui/component/scaffold/app_scaffold.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/route/app_route.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'list/advice_list_page.dart';

class AdviceTabPage extends HookConsumerWidget {
  const AdviceTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fabController = useAnimationController(
      duration: const Duration(
        milliseconds: 200,
      ),
    );
    final fabAnimation = CurvedAnimation(
      parent: fabController,
      curve: Curves.easeInOut,
    );
    fabController.forward();

    final l10n = useL10n();
    final controller = ref.read(adviceTabPageControllerProvider.notifier);
    useMemoized(
      () {
        controller.onBuildStart();
      },
    );
    return AppScaffold(
      body: _TabBody(
        fabController: fabController,
        fabAnimation: fabAnimation,
      ),
      title: l10n.adviceList,
      disableElevation: true,
    );
  }
}

class _FloatingActionButtons extends HookConsumerWidget {
  const _FloatingActionButtons(this.fabAnimation);

  final Animation<double> fabAnimation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appThemeProvider).appColors;
    final controller = ref.read(adviceTabPageControllerProvider.notifier);

    final l10n = useL10n();
    final filterFab = FilterFabWidget(
      appColors: appColors,
      l10n: l10n,
      fabAnimation: fabAnimation,
      onPressed: () {
        // TODO 絞り込みのBottomSheet表示
      },
    );

    final adviceAddFab = AdviceAddFabWidget(
      appColors: appColors,
      l10n: l10n,
      fabAnimation: fabAnimation,
      onPressed: () {
        _openEditAdvice(
          onEdited: controller.onEdited,
          context: context,
        );
      },
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        adviceAddFab,
        filterFab,
      ],
    );
  }

  /// Method
  void _openEditAdvice({
    required VoidCallback onEdited,
    required BuildContext context,
  }) {
    context.router.push(AdviceEditRoute()).then((value) {
      onEdited();
    });
  }
}

class _TabBody extends HookConsumerWidget {
  const _TabBody({
    required this.fabController,
    required this.fabAnimation,
  });

  final AnimationController fabController;
  final Animation<double> fabAnimation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appThemeProvider).appColors;
    final l10n = useL10n();

    return DefaultTabController(
      length: CompleteType.values.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          backgroundColor: appColors.primaryColor,
          toolbarHeight: 0,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BubbleTabIndicator(
              indicatorHeight: 25.0,
              indicatorColor: appColors.primaryObjectColorAccent,
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
              indicatorRadius: 30,
              insets: const EdgeInsets.all(30),
            ),
            unselectedLabelColor: appColors.textDisabled,
            labelColor: appColors.textWhite,
            tabs: [
              Tab(text: CompleteType.all.toText(l10n)),
              Tab(text: CompleteType.inCompleted.toText(l10n)),
              Tab(text: CompleteType.completed.toText(l10n)),
            ],
          ),
        ),
        body: _Body(fabController),
        floatingActionButton: _FloatingActionButtons(fabAnimation),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body(this.fabController);

  final AnimationController fabController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appThemeProvider).appColors;
    final tabBarView = TabBarView(
      children: [
        AdviceListPage(
          completeType: CompleteType.all,
          onScrollReverse: (isReverseScroll) {
            _onScrollReverse(
              isReverseScroll: isReverseScroll,
              fabController: fabController,
            );
          },
        ),
        AdviceListPage(
          completeType: CompleteType.inCompleted,
          onScrollReverse: (isReverseScroll) {
            _onScrollReverse(
              isReverseScroll: isReverseScroll,
              fabController: fabController,
            );
          },
        ),
        AdviceListPage(
          completeType: CompleteType.completed,
          onScrollReverse: (isReverseScroll) {
            _onScrollReverse(
              isReverseScroll: isReverseScroll,
              fabController: fabController,
            );
          },
        ),
      ],
    );
    return Container(
      color: appColors.surfaceColor,
      child: tabBarView,
    );
  }

  void _onScrollReverse({
    required bool isReverseScroll,
    required AnimationController fabController,
  }) {
    if (fabController.isAnimating) {
      return;
    }
    if (isReverseScroll) {
      if (fabController.isCompleted) {
        fabController.reverse();
      }
    } else {
      if (fabController.isDismissed) {
        fabController.forward();
      }
    }
  }
}
