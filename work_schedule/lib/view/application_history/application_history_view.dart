import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view/component/month_picker_filter.dart';
import '../../view_model/provider.dart';
import 'application_history_async_list_view.dart';

class ApplicationHistoryView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final applicationHistoryListAsyncValueController =
        useProvider(applicationHistoryListAsyncValueProvider.notifier);
    final applicationHistoryState = useProvider(applicationHistoryProvider);

    useEffect(() {
      Future.microtask(() async {
        try {
          // バックエンドから申請履歴を取得
          await applicationHistoryListAsyncValueController
              .getApplicationsByMonth(applicationHistoryState.monthFilter);
        } catch (e, stackTrace) {
          print(stackTrace);
          Fluttertoast.showToast(msg: e.toString());
          Navigator.pop(context);
        }
      });
    }, const []);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('申請履歴'),
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          try {
            // バックエンドから申請履歴を取得
            await applicationHistoryListAsyncValueController
                .getApplicationsByMonth(applicationHistoryState.monthFilter);
          } catch (e, stackTrace) {
            print(stackTrace);
            Fluttertoast.showToast(msg: e.toString());
            Navigator.pop(context);
          }
        },
        child: Column(
          children: [
            // Monthフィルター
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: MonthPickerFilter(),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                child: ApplicationHistoryAsyncListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
