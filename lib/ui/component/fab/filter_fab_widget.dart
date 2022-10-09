import 'package:app/gen/assets.gen.dart';
import 'package:app/ui/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class FilterFabWidget extends StatelessWidget {
  final AppColors appColors;
  final L10n l10n;
  final Animation<double> fabAnimation;
  final VoidCallback onPressed;

  const FilterFabWidget({
    Key? key,
    required this.appColors,
    required this.l10n,
    required this.fabAnimation,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon = Assets.svgs.icVectorFilter.svg(
      color: appColors.secondaryObjectColor,
      width: 20,
      height: 20,
    );
    final filter = Text(
      l10n.filter,
      style: TextStyle(
        color: appColors.textWhite,
        fontSize: 8,
        fontWeight: FontWeight.w600,
      ),
    );
    final fab = CupertinoButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: appColors.primaryObjectColorAccent,
        ),
        child: SizedBox(
          width: 32,
          height: 32,
          child: Column(
            children: [
              icon,
              filter,
            ],
          ),
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
