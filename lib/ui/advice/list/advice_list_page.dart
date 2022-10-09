import 'dart:math' as math;

import 'package:app/domain/advice.dart';
import 'package:app/domain/complete_type.dart';
import 'package:app/ui/advice/advice_tab_page_controller.dart';
import 'package:app/ui/route/app_route.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrolls_to_top/scrolls_to_top.dart';

import 'widget/advice_list_item.dart';

class AdviceListPage extends HookConsumerWidget {
  final CompleteType completeType;
  final ValueChanged<bool> onScrollReverse;

  const AdviceListPage({
    Key? key,
    required this.completeType,
    required this.onScrollReverse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColors = ref.watch(appThemeProvider).appColors;

    final controller = ref.read(adviceTabPageControllerProvider.notifier);

    final scrollController = useScrollController();
    scrollController.addListener(() {
      final isScrollReverse = scrollController.position.userScrollDirection ==
          ScrollDirection.reverse;
      onScrollReverse(isScrollReverse);
    });

    var adviceList = [];
    switch (completeType) {
      case CompleteType.completed:
        adviceList = ref.watch(adviceTabPageControllerProvider
            .select((value) => value.adviceCompletedList));
        break;
      case CompleteType.inCompleted:
        adviceList = ref.watch(adviceTabPageControllerProvider
            .select((value) => value.adviceInCompletedList));
        break;
      default:
        adviceList = ref.watch(adviceTabPageControllerProvider
            .select((value) => value.adviceAllList));
    }
    final scrollView = CustomScrollView(
      controller: scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) {
              final itemIndex = i ~/ 2;
              if (i.isEven) {
                final model = adviceList[itemIndex];
                return AdviceListItem(
                  model: model,
                  onTap: () {
                    _openEditAdvice(
                      context: context,
                      controller: controller,
                      advice: model.advice,
                    );
                  },
                  onTapCheck: () {
                    controller.onTapCheck(model);
                  },
                );
              }
              return Container(
                margin: const EdgeInsets.only(
                  left: 16,
                ),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: appColors.borderGray,
                ),
              );
            },
            childCount: math.max(0, adviceList.length * 2 - 1),
          ),
        ),
      ],
    );
    return ScrollsToTop(
      child: scrollView,
      onScrollsToTop: (event) async {
        _scrollToTop(scrollController);
      },
    );
  }

  /// Method
  void _openEditAdvice({
    required AdviceTabPageController controller,
    required BuildContext context,
    required Advice advice,
  }) {
    context.router.push(AdviceEditRoute(advice: advice)).then((value) {
      controller.onEdited();
    });
  }

  void _scrollToTop(ScrollController scrollController) {
    if (!scrollController.hasClients) {
      return;
    }
    final scrollPosition = scrollController.position;
    if (scrollPosition.maxScrollExtent > scrollPosition.minScrollExtent) {
      scrollController.animateTo(
        0,
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.easeOut,
      );
    }
  }
}
