import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_model/provider.dart';
import '../../view_model/util/style.dart';

/// 時間外理由
class OvertimeReason extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final applicationState = useProvider(applicationProvider);

    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.more_time),
          title: Text(
            '時間外理由',
            style: Style.applicationItemStyle,
          ),
          horizontalTitleGap: 0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 20, bottom: 20),
          child: TextField(
            controller: applicationState.workApplicationState.overtimeReason,
            scrollPadding: const EdgeInsets.only(bottom: 30.0),
            // 折り返す
            maxLines: null,
            // キーボードの上に"完了"を表示させ、"完了"押下にてフォーカスを外す
            focusNode:
                applicationState.workApplicationState.overtimeReasonFocusNode,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: '時間外がある場合は入力',
              labelStyle: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
