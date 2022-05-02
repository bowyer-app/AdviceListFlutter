import 'dart:async';

import 'package:app/domain/advice.dart';
import 'package:app/ui/advice/edit/advice_edit_page_event.dart';
import 'package:app/ui/component/menu/menu_button.dart';
import 'package:app/ui/component/scaffold/app_scaffold.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'advice_edit_page_controller.dart';

class AdviceEditPage extends StatefulHookConsumerWidget {
  const AdviceEditPage({this.advice, Key? key}) : super(key: key);

  final Advice? advice;

  @override
  _AdviceEditPage createState() => _AdviceEditPage();
}

class _AdviceEditPage extends ConsumerState<AdviceEditPage> {
  StreamSubscription? _subscription;

  /// Lifecycle
  @override
  void initState() {
    final controller = ref.read(adviceEditPageController.notifier);
    _subscription = controller.adviceEditPageEvent.stream.listen(_handleEvent);
    controller.onInitState(widget.advice);
    super.initState();
  }

  @override
  void dispose() {
    if (_subscription != null) {
      _subscription!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    final title =
        widget.advice != null ? l10n.adviceEdit : l10n.adviceAdd;
    return AppScaffold(
      body: _buildBody(),
      title: title,
      menuActions: [_buildMenuButton()],
    );
  }

  Widget _buildMenuButton() {
    final controller = ref.read(adviceEditPageController.notifier);
    return MenuButton(
      onTap: controller.onTapSave,
    );
  }

  Widget _buildBody() {
    final controller = ref.read(adviceEditPageController.notifier);

    final TextEditingController _controller =
        TextEditingController(text: widget.advice?.adviceText);

    final textField = TextField(
      controller: _controller,
      onChanged: controller.onTextChanged,
      keyboardType: TextInputType.multiline,
      maxLines: 10000,
    );
    return Container(
      padding: const EdgeInsets.all(
        16,
      ),
      child: textField,
    );
  }

  /// Event
  void _handleEvent(AdviceEditPageEvent event) {
    switch (event.runtimeType) {
      case AdviceEditPageFinish:
        _finish();
        break;
      case AdviceEditPageNeedText:
        _presentNeedTextDialog();
        break;
    }
  }

  /// Method
  void _finish() {
    final router = AutoRouter.of(context);
    router.pop();
  }

  void _presentNeedTextDialog() {
    final l10n = L10n.of(context)!;
    showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text(l10n.adviceNeedTextTitle),
        actions: [
          CupertinoDialogAction(
            child: Text(l10n.ok),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
