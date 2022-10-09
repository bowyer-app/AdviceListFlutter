import 'package:flutter/cupertino.dart';

class AppButtonWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const AppButtonWidget({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: onTap,
      minSize: 12,
      child: child,
    );
  }
}
