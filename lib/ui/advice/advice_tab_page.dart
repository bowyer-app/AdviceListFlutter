import 'package:app/domain/complete_type.dart';
import 'package:app/ui/advice/advice_tab_page_controller.dart';
import 'package:app/ui/component/fab/advice_add_fab_widget.dart';
import 'package:app/ui/component/fab/filter_fab_widget.dart';
import 'package:app/ui/component/scaffold/app_scaffold.dart';
import 'package:app/ui/component/theme/theme_switch_widget.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/route/app_route.dart';
import 'package:app/ui/theme/app_colors.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'list/advice_list_page.dart';

class AdviceTabPage extends HookWidget {
  const AdviceTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabController =
        useTabController(initialLength: CompleteType.values.length);
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
    return HookConsumer(
      builder: (BuildContext context, ref, child) {
        final controller = ref.read(adviceTabPageControllerProvider.notifier);
        useMemoized(
          () {
            controller.onBuildStart();
          },
        );
        final appColors = ref.watch(appThemeProvider).appColors;
        return AppScaffold(
          body: _buildTab(
            l10n: l10n,
            tabController: tabController,
            fabController: fabController,
            appColors: appColors,
            fabAnimation: fabAnimation,
            context: context,
            controller: controller,
          ),
          title: l10n.adviceList,
          disableElevation: true,
          menuActions: const [
            ThemeSwitchWidget(),
          ],
        );
      },
    );
  }

  Widget _buildTab({
    required L10n l10n,
    required TabController tabController,
    required AnimationController fabController,
    required AppColors appColors,
    required Animation<double> fabAnimation,
    required BuildContext context,
    required AdviceTabPageController controller,
  }) {
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
        body: _buildBody(
          appColors: appColors,
          fabController: fabController,
        ),
        floatingActionButton: _buildFloatingActionButtons(
          appColors: appColors,
          l10n: l10n,
          fabAnimation: fabAnimation,
          context: context,
          controller: controller,
        ),
      ),
    );
  }

  Widget _buildFloatingActionButtons({
    required AppColors appColors,
    required L10n l10n,
    required Animation<double> fabAnimation,
    required BuildContext context,
    required AdviceTabPageController controller,
  }) {
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
          controller: controller,
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

  Widget _buildBody({
    required AppColors appColors,
    required AnimationController fabController,
  }) {
    return Container(
      color: appColors.surfaceColor,
      child: _buildTabBarView(fabController),
    );
  }

  Widget _buildTabBarView(AnimationController fabController) {
    return TabBarView(
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
  }

  /// Method
  void _openEditAdvice({
    required AdviceTabPageController controller,
    required BuildContext context,
  }) {
    context.router.push(AdviceEditRoute()).then((value) {
      controller.onEdited();
    });
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
