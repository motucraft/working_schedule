import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_model/provider.dart';
import '../../view_model/util/style.dart';

class SettingView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final settingController = useProvider(settingProvider.notifier);
    final settingState = useProvider(settingProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('設定'),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 8),
            SwitchListTile(
              title: Text(
                'ダークモード',
                style: Style.applicationItemStyle,
              ),
              secondary: Icon(Icons.party_mode),
              value: settingState.isDarkTheme,
              onChanged: (bool value) {
                settingController.setIsDarkTheme(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
