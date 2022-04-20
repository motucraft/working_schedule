import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'localization/JapaneseCupertinoLocalizations.dart';
import 'view/authentication/login_view.dart';
import 'view_model/provider.dart';

void main() async {
  await DotEnv.load();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final settingState = useProvider(settingProvider);

    return MaterialApp(
      title: '勤務予定管理',
      debugShowCheckedModeBanner: false,
      theme: settingState.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        JapaneseCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("eu", "US"),
        const Locale("ja", "JP"),
      ],
      home: LoginView(),
    );
  }
}
