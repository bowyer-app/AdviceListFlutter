import 'package:app/gen/assets.gen.dart';
import 'package:app/ui/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class AdviceAddFabWidget extends StatelessWidget {
  final AppColors appColors;
  final L10n l10n;
  final Animation<double> fabAnimation;
  final VoidCallback onPressed;

  const AdviceAddFabWidget({
    Key? key,
    required this.appColors,
    required this.l10n,
    required this.fabAnimation,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fab = CupertinoButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: appColors.primaryObjectColorAccent,
        ),
        child: Assets.svgs.icVectorEdit.svg(
          color: appColors.secondaryObjectColor,
          width: 24,
          height: 24,
        ),
      ),
    );
    return ScaleTransition(
      scale: fabAnimation,
      alignment: Alignment.center,
      child: fab,
    );
  }
}
